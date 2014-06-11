MACHINES=$(shell bin/kitchen list -b 2> /dev/null)
LOG=debug
S3_REPO=apitoolsrepo

default: converge all

all: build
build: $(MACHINES)

converge:
	bin/kitchen converge all

$(MACHINES): % :
	bin/kitchen exec $@ -c 'cd apitools-monitor && make omnibus'

omnibus: install
	bash -cl 'bin/omnibus build apitools-monitor -l=$(LOG)'

install:
	bash -cl 'bundle install --binstubs'

login:
	echo "Run: cd apitools-monitor && make"

s3:
	s3cmd --human-readable-sizes --follow-symlinks --acl-public --access_key=$(ACCESS_KEY) --secret_key=$(SECRET_KEY) sync packages s3://$(S3_REPO)

aptly:
	aptly repo add apitools-debian packages/ubuntu/7.2/latest.deb
	aptly repo add apitools-ubuntu packages/ubuntu/13.04/latest.deb
	aptly publish repo -distribution=precise -skip-signing=true apitools-ubuntu
	aptly publish repo -distribution=raring -skip-signing=true apitools-ubuntu
	aptly publish repo -distribution=saucy -skip-signing=true apitools-ubuntu
	aptly publish repo -distribution=trusty -skip-signing=true apitools-ubuntu
	aptly publish repo -distribution=wheezy -skip-signing=true apitools-debian
	s3cmd --human-readable-sizes --follow-symlinks --acl-public --access_key=$(ACCESS_KEY) --secret_key=$(SECRET_KEY) sync $(HOME)/.aptly/public/ s3://$(S3_REPO)
