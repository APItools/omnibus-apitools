name 'apitools-lua'
version '0.0.1'

dependency 'expat'
dependency 'apitools-luarocks'

build do
  command "#{install_dir}/embedded/bin/luarocks install lpeg"
  command "#{install_dir}/embedded/bin/luarocks install lunit"
  command "#{install_dir}/embedded/bin/luarocks install luasocket"
  command "#{install_dir}/embedded/bin/luarocks install sha2"
  command "#{install_dir}/embedded/bin/luarocks install luajson"
  command "#{install_dir}/embedded/bin/luarocks install luaexpat EXPATLIBPATH=#{install_dir}/embedded/lib/ EXPATINCPATH=#{install_dir}/embedded/lib/"
  command "#{install_dir}/embedded/bin/luarocks LUA_LDIR=#{install_dir}/embedded/share/lua/5.1/ LUA_CDIR=#{install_dir}/embedded/lib/lua/5.1/ LUA_INC=#{install_dir}/embedded/luajit/include/luajit-2.1 EXPAT_INCDIR=#{install_dir}/embedded/include/ EXPAT_LIBDIR=#{install_dir}/embedded/lib install luaexpat "
end
