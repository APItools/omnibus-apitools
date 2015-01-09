name 'apitools-luarocks'
default_version '2.2.0'

source url: "http://luarocks.org/releases/luarocks-#{version}.tar.gz"

version('2.1.2') { source md5: '0afc5fd6ee6ec6128fccda1bc559f41e' }
version('2.2.0') { source md5: 'eb142e0f0891ea4243ef3b7582cfbbaa' }

relative_path "luarocks-#{version}"

dependency 'apitools-openresty'

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

  command %{echo 'external_deps_dirs = { "#{install_dir}/embedded", "/usr/local", "/usr" }' > #{install_dir}/embedded/luarocks/config-5.1.lua}
  command "ln -s #{install_dir}/embedded/luajit/bin/luajit-2.1.0-alpha #{install_dir}/embedded/luajit/bin/lua"
end
