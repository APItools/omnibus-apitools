source 'https://rubygems.org'

# Install omnibus software
gem 'omnibus', '~> 3.1'
gem 'omnibus-software', github: 'APItools/omnibus-software', branch: 'omnibus/3.2-stable'

gem 'package_cloud'

group :kitchen do
  # Use Berkshelf for resolving cookbook dependencies
  gem 'berkshelf', '~> 3.0'

  # Use Test Kitchen with Vagrant for converging the build environment
  # from github to use latest 'kitchen exec' command for automated builds
  gem 'test-kitchen',    github: 'test-kitchen/test-kitchen'
  gem 'kitchen-vagrant', '~> 0.14'
end
