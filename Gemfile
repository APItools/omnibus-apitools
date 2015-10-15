source 'https://rubygems.org'

gem 'rake'

# Install omnibus software
gem 'omnibus', '~> 4.0'
gem 'omnibus-software', github: 'opscode/omnibus-software', branch: 'master'
gem 'omnibus-openresty', github: '3scale/omnibus-openresty', branch: 'master'

gem 'package_cloud'

group :kitchen do
  # Use Berkshelf for resolving cookbook dependencies
  gem 'berkshelf', '~> 4.0'

  # Use Test Kitchen with Vagrant for converging the build environment
  # from github to use latest 'kitchen exec' command for automated builds
  gem 'test-kitchen', '~> 1.4.0'
  gem 'kitchen-vagrant', '~> 0.17'
end
