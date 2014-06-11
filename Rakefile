require 'json'
require 'pathname'

task :packages do
	pkg = Pathname('pkg')
	metadata = Pathname.glob(pkg.join '*.metadata.json')

	packages = Pathname('packages').tap(&:mkpath)

	metadata.each do |file|
		mt = JSON.parse(file.read) 
		platform, platform_version, basename = mt.values_at('platform', 'platform_version', 'basename')
		output = packages.join(platform, platform_version).tap(&:mkpath)
		package = Pathname(pkg.join basename)
		package.rename(output.join(basename))
		file.unlink
	end
end
