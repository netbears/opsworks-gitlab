# frozen_string_literal: true

execute 'curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash'

execute 'apt-get update'

package 'gitlab-ce' do
  version "#{node['gitlab']['version']}-ce.0"
end

directory "#{node['gitlab']['install_path']}/" do
  owner 'root'
  group 'root'
  mode  '0644'
  action :create
end

directory "#{node['gitlab']['backup_path']}/" do
  owner 'root'
  group 'root'
  mode  '0644'
  action :create
end

template "#{node['gitlab']['install_path']}/gitlab.rb" do
  source 'gitlab.rb.erb'
  owner 'root'
  group 'root'
  mode  '0600'
  action :create
end

execute "echo \"127.0.0.1 #{node['gitlab']['domain']}\" >> /etc/hosts"

execute 'gitlab-ctl reconfigure'

cron 'backup_gitlab' do
  hour '0'
  minute '30'
  user 'root'
  command 'gitlab-rake gitlab:backup:create'
end
