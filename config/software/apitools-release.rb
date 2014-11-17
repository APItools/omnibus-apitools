name 'apitools-release'
default_version '201409231249'

dependency 'apitools-lua'
# dependency 'supervisor'

relative_path "monitor-#{version}"

source url: "https://github.com/APItools/monitor/archive/#{version}.tar.gz"

version('201409231249') { source md5: "ab06ec6c192d97aff25d28e695051f45" }

build do
  command ["cp -r . #{install_dir}/release" ]
end
