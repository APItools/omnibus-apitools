name 'apitools-lua'
default_version '0.0.1'

source :url => "http://luarocks.org/releases/luarocks-2.1.2.tar.gz",
       :md5 => "0afc5fd6ee6ec6128fccda1bc559f41e"


dependency 'expat'
dependency "apitools-openresty"

relative_path "luarocks-2.1.2"

build do
  env = {
    "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/luajit/include/luajit-2.1",
    "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/luajit/include/luajit-2.1",
    "LD_RUN_PATH" => "#{install_dir}/embedded/lib",
    "LUA_CPATH" => "#{install_dir}/embedded/lib",
  }
  command ['./configure', "--prefix=#{install_dir}/embedded/" ,
           "--with-lua=#{install_dir}/embedded/luajit",
           "--rocks-tree=#{install_dir}/embedded/luajit/",
           "--with-lua-include=#{install_dir}/embedded/luajit/include/luajit-2.1",
           "--sysconfdir=#{install_dir}/embedded/luarocks --force-config"
          ].join(" ")

  lua_path = "#{install_dir}/embedded/lualib/?"
  lua_cpath = "#{install_dir}/embedded/lualib/?"

  # command "apt-get install luarocks"
  command "make build"
  command "make install"

  command "ln -s #{install_dir}/embedded/luajit/bin/luajit-2.1.0-alpha #{install_dir}/embedded/luajit/bin/lua"

  command "#{install_dir}/embedded/bin/luarocks install lpeg"
  command "#{install_dir}/embedded/bin/luarocks install lunit"
  command "#{install_dir}/embedded/bin/luarocks install luasocket"
  command "#{install_dir}/embedded/bin/luarocks install sha2"
  command "#{install_dir}/embedded/bin/luarocks install luajson"
  #command "#{install_dir}/embedded/bin/luarocks install luaexpat EXPATLIBPATH=#{install_dir}/embedded/lib/ EXPATINCPATH=#{install_dir}/embedded/lib/"
  command "#{install_dir}/embedded/bin/luarocks  LUA_LDIR=#{install_dir}/embedded/share/lua/5.1/ LUA_CDIR=#{install_dir}/embedded/lib/lua/5.1/ LUA_INC=#{install_dir}/embedded/luajit/include/luajit-2.1 EXPAT_INCDIR=#{install_dir}/embedded/include/ EXPAT_LIBDIR=#{install_dir}/embedded/lib install luaexpat "
end
