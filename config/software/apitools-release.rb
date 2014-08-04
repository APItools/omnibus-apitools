name 'apitools-release'
default_version '201408041328'

dependency 'apitools-lua'
# dependency 'supervisor'

relative_path "monitor-#{version}"

source :url => "https://github.com/APItools/monitor/archive/#{version}.tar.gz",
       :md5 => "4171f68b30572cbc9ce0506d206e2a64"

build do
  command ["cp -r . #{install_dir}/release" ]
end
