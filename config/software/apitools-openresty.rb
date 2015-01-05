#
# Copyright 2014 3scale
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# These options are required for all software definitions

name 'apitools-openresty'
default_version '1.7.4.1'

# A software can specify more than one version that is available for install
version('1.7.4.1') { source md5: "e4b10833beb0fc8e14dbe1ba6af3126e" }

source url: "http://openresty.org/download/ngx_openresty-#{version}.tar.gz"

relative_path "ngx_openresty-#{version}"

dependency 'pcre'
dependency 'openssl'
dependency 'zlib'

build do
  # Setup a default environment from Omnibus - you should use this Omnibus
  # helper everywhere. It will become the default in the future.
  env = with_standard_compiler_flags(with_embedded_path)

  # "command" is part of the build DSL. There are a number of handy options
  # available, such as "copy", "sync", "ruby", etc. For a complete list, please
  # consult the Omnibus gem documentation.
  #
  # "install_dir" is exposed and refers to the top-level projects +install_dir+
  command ["./configure",
           "--prefix=#{install_dir}/embedded",
           # Building Nginx with non-system OpenSSL
           # http://www.ruby-forum.com/topic/207287#902308
           "--with-ld-opt=\"-L#{install_dir}/embedded/lib -Wl,-rpath,#{install_dir}/embedded/lib -lssl -lcrypto -ldl -lz\"",
           "--with-cc-opt=\"-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include\"",
           '--with-md5-asm',
           '--with-luajit-xcflags=-DLUAJIT_ENABLE_CHECKHOOK',
           '--with-http_gunzip_module',
           '--with-sha1-asm',
           '--with-pcre-jit',
           '--with-luajit',
           '--without-http_fastcgi_module',
           '--without-http_uwsgi_module',
           '--without-http_scgi_module',
           '--without-http_ssi_module',
           '--without-mail_smtp_module',
           '--without-mail_imap_module',
           '--without-mail_pop3_module',].join(' '), env: env

  # You can have multiple steps - they are executed in the order in which they
  # are read.
  #
  # "workers" is a DSL method that returns the most suitable number of
  # builders for the currently running system.
  make "-j #{workers}", env: env
  make 'install', env: env
end
