#
# Copyright 2014 3scale
#
# All Rights Reserved.
#

name 'apitools-monitor'
maintainer '3scale'
homepage 'http://www.apitools.com'

install_dir "#{default_root}/#{name}"
build_version Omnibus::BuildVersion.semver
build_iteration 1

# creates required build directories
dependency 'preparation'

# apitools-monitor dependencies/components
# dependency 'somedep'

dependency 'apitools-release'

# runtime_dependency 'luarocks'

package 'deb' do

  '--deb-recommends redis-server --deb-recommends supervisor'
end

# version manifest file
dependency 'version-manifest'

exclude '**/.git'
exclude '**/bundler/git'
