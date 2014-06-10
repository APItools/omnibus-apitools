# Packaging

To make a package for apitools:

* cd omnibus-apitools-monitor
* bin/omnibus build project apitools-monitor -l=debug

The package should be in pkg/.....deb

# creating repo

Install aptly from `deb http://repo.aptly.info/ squeeze main`

* aptly repo create apitools

* aptly repo add apitools ./pkg/apitools-monitor_0.0.0+20140527153238-1_amd64.deb

* aptly repo show apitools

* aptly -skip-signing=true -distribution='saucy' publish repo apitools

* s3cmd --verbose --acl-public sync ~/.aptly/public/ 's3://apitools-packages-test/'
