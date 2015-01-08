#
# This file is used to configure the apitools-monitor project. It contains
# come minimal configuration examples for working with Omnibus. For a full list
# of configurable options, please see the documentation for +omnibus/config.rb+.
#

# Build internally
# ------------------------------
# By default, Omnibus uses system folders (like +/var+ and +/opt+) to build and
# cache compontents. If you would to build everything internally, you can
# uncomment the following options. This will prevent the need for root
# permissions in most cases. You will also need to update the apitools-monitor
# project configuration to build at +./local/omnibus/build+ instead of
# +/opt/apitools-monitor+
#

workers(ENV.fetch('OMNIBUS_WORKERS'){ workers })

# Enable S3 asset caching
# ------------------------------
# use_s3_caching true
# s3_access_key  'something'
# s3_secret_key  'something'
# s3_bucket      'some-bucket'


# release_s3_bucket      ENV['S3_BUCKET_NAME']
# release_s3_access_key  ENV['S3_ACCESS_KEY']
# release_s3_secret_key  ENV['S3_SECRET_KEY']

# Customize compiler bits
# ------------------------------
# solaris_compiler 'gcc'
# build_retries 5
