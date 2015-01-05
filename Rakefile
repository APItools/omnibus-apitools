require 'json'
require 'pathname'
require 'package_cloud'

desc 'push packages to packagecloud.io'
task :packages do
  config = PackageCloud::ConfigFile.new
  config.read_or_create
  client = PackageCloud::Client.new(config)
  distributions = client.distributions

  pkgs = Pathname('pkg')
  metadata = Pathname.glob(pkgs.join '*.metadata.json')

  metadata.each do |file|
    mt = JSON.parse(file.read)
    platform, platform_version, basename = mt.values_at('platform', 'platform_version', 'basename')
    platform_version += '.0' if platform_version =~ /^\d$/
    platform_name = distributions
      .fetch(File.extname(basename).delete('.'))
      .find{|dist| dist['index_name'] == platform }
      .fetch('versions')
      .find{|v| v['version_number'] == platform_version }
      .fetch('index_name')

    pkg = pkgs.join(basename)

    system("package_cloud push apitools/monitor/#{platform}/#{platform_name} #{pkg}")
  end
end

task :build do
  exec('omnibus', 'build', 'apitools-monitor', '--log-level=internal')
end

task test: :build

task default: :test
