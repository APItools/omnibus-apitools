name 'apitools-luarocks'
default_version '2.1.2'

source url: "http://luarocks.org/releases/luarocks-#{version}.tar.gz"


version('2.1.2') { source md5: '0afc5fd6ee6ec6128fccda1bc559f41e' }

dependency 'apitools-openresty'

relative_path 'luarocks-2.1.2'

build do
  env = with_standard_compiler_flags(with_embedded_path)
  command ['./configure',
           "--prefix=#{install_dir}/embedded/" ,
           "--with-lua=#{install_dir}/embedded/luajit",
           "--rocks-tree=#{install_dir}/embedded/luajit/",
           "--with-lua-include=#{install_dir}/embedded/luajit/include/luajit-2.1",
           "--sysconfdir=#{install_dir}/embedded/luarocks --force-config"
          ].join(' '), env: env

  lua_path = "#{install_dir}/embedded/lualib/?"
  lua_cpath = "#{install_dir}/embedded/lualib/?"

  make 'build', env: env
  make 'install', env: env

  command "ln -s #{install_dir}/embedded/luajit/bin/luajit-2.1.0-alpha #{install_dir}/embedded/luajit/bin/lua"
end
