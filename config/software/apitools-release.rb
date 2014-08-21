name 'apitools-release'
default_version '201408211748'

dependency 'apitools-lua'
# dependency 'supervisor'

relative_path "monitor-#{version}"

source :url => "https://github.com/APItools/monitor/archive/#{version}.tar.gz",
       :md5 => "8cdcd8768dc4c20c7df6ba09e48c6155"

build do
  command ["cp -r . #{install_dir}/release" ]
end
