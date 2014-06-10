MACHINES=$(shell bin/kitchen list -b 2> /dev/null)
LOG=debug

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

