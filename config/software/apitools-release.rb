name 'apitools-release'

dependency 'apitools-lua'
# dependency 'supervisor'

relative_path 'release'

source git: 'https://github.com/APItools/monitor'

default_version '229dc0fd60214df546688f0381ce534df2f55e16'

build do
  command 'bundle install --without test'
  command 'rake release -- -y'
  copy 'release', File.join(install_dir, 'release')
end
