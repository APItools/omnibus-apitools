
name 'apitools-monitor'
maintainer '3scale'
homepage 'http://www.apitools.com'

install_path    '/opt/apitools-monitor'
build_version   Omnibus::BuildVersion.new.semver
build_iteration 1

# creates required build directories
dependency 'preparation'

# apitools-monitor dependencies/components
# dependency 'somedep'

dependency 'apitools-release'

# runtime_dependency 'luarocks'

extra_package_file '--deb-recommends supervisor'
extra_package_file '--deb-recommends redis-server'

# version manifest file
dependency 'version-manifest'

exclude '\.git*'
exclude 'bundler\/git'
