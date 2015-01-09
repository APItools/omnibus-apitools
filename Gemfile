source 'https://rubygems.org'

gem 'rake'

# Install omnibus software
gem 'omnibus', '~> 4.0'
gem 'omnibus-software', github: 'opscode/omnibus-software', branch: 'master'

gem 'package_cloud'

group :kitchen do
  # Use Berkshelf for resolving cookbook dependencies
  gem 'berkshelf', '~> 3.0'

  # Use Test Kitchen with Vagrant for converging the build environment
  # from github to use latest 'kitchen exec' command for automated builds
  gem 'test-kitchen', '~> 1.2.2.dev', github: 'test-kitchen/test-kitchen'
  gem 'kitchen-vagrant', '~> 0.15'
end
