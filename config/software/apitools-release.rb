name 'apitools-release'
default_version '201406111449'

dependency 'apitools-lua'
# dependency 'supervisor'

relative_path "monitor-#{version}"

source :url => "https://github.com/APItools/monitor/archive/#{version}.tar.gz",
       :md5 => "95d23f98dae5cfdcc5f0fe5bb9660f09"

build do
  command ["cp -r . #{install_dir}/release" ]
end
