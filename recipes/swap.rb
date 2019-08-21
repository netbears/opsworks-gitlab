# frozen_string_literal: true

bash 'install-swap' do
  user 'root'
  code <<-BASH
    if [ ! -f #{node['swap']['file']} ]; then
        swapoff
        dd if=/dev/zero of=#{node['swap']['file']} bs=1M count=#{node['swap']['size']}
        mkswap #{node['swap']['file']}
        chmod 600 #{node['swap']['file']}
        swapon #{node['swap']['file']}
    fi
  BASH
end

execute "sysctl -w vm.swappiness=#{node['swap']['swappiness']}"
execute "sysctl -w vm.vfs_cache_pressure=#{node['swap']['vfs_cache_pressure']}"
