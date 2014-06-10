name 'apitools-release'
default_version '201406071249'

dependency 'apitools-lua'
# dependency 'supervisor'

relative_path "monitor-#{version}"

source :url => "https://github.com/APItools/monitor/archive/#{version}.tar.gz",
       :md5 => "dd57c254777748f7b1521094b095c4b4"

build do
  command ["cp -r . #{install_dir}/release" ]
end
