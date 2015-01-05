name 'apitools-release'
default_version '201501051629'

dependency 'apitools-lua'
# dependency 'supervisor'

relative_path 'release'

#source url: "https://github.com/APItools/monitor/releases/download/#{version}/release-#{version}.tar.gz"
source git: 'https://github.com/APItools/monitor'
#version('201409231249') { source md5: '3a9b30622084ff67ba309e67dd2d1fa8' }

build do
  command 'bundle install --without test'
  command 'rake release -- -y'
  copy 'release', File.join(install_dir, 'release')
end
