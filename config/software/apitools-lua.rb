name 'apitools-lua'
default_version '0.0.1'

# locking openresty version breaks the digest and crashes (removes the md5 of source)
# override :openresty, version: '1.7.4.1'

dependency 'expat'
dependency 'openresty-luarocks'

build do
  command "#{install_dir}/embedded/bin/luarocks install lpeg 0.12-1"
  command "#{install_dir}/embedded/bin/luarocks install lunit"
  command "#{install_dir}/embedded/bin/luarocks install luasocket"
  command "#{install_dir}/embedded/bin/luarocks install sha2"
  command "#{install_dir}/embedded/bin/luarocks install luajson"
  command "#{install_dir}/embedded/bin/luarocks install luaexpat"
end
