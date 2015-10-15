name 'apitools-release'

dependency 'apitools-lua'
# dependency 'supervisor'

relative_path 'release'

source git: 'https://github.com/APItools/monitor'
default_version '201510141454'

build do
  command 'bundle install --without test'
  command 'rake release -- -y'
  copy 'release', File.join(install_dir, 'release')
end
