name 'apitools-release'

dependency 'apitools-lua'
# dependency 'supervisor'

relative_path 'release'

version('201501051710') { source git: 'https://github.com/APItools/monitor' }

build do
  command 'bundle install --without test'
  command 'rake release -- -y'
  copy 'release', File.join(install_dir, 'release')
end
