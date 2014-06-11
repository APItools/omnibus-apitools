require 'json'
require 'pathname'

task :packages do
	pkgs = Pathname('pkg')
	metadata = Pathname.glob(pkgs.join '*.metadata.json')

	packages = Pathname('packages').tap(&:mkpath)

	metadata.each do |file|
		mt = JSON.parse(file.read) 
		platform, platform_version, basename = mt.values_at('platform', 'platform_version', 'basename')
		output = packages.join(platform, platform_version).tap(&:mkpath)
		pkg = Pathname(pkgs.join basename)
		package = output.join(basename)
		pkg.rename(package)
		latest = output.join('latest')
		latest.unlink if latest.symlink?
		latest.make_symlink(package)
		file.rename(package.to_s + '.metadata.json')
	end
end
