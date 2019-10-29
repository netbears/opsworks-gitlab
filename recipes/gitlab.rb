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
  variables(
    elb_https: (node['gitlab']['redirect_http_to_https']).to_s
  )
  action :create
end

execute 'gitlab-ctl reconfigure'

cron 'backup_gitlab' do
  hour '0'
  minute '30'
  user 'root'
  command 'gitlab-rake gitlab:backup:create'
end

cron 'archive_gitlab_secrets' do
  hour '0'
  minute '30'
  user 'root'
  command "tar -cf #{node['gitlab']['backup_path']}/$(date '+etc-gitlab-%F.tar') -C #{node['gitlab']['install_path']}"
end

cron 'backup_gitlab_secrets' do
  hour '0'
  minute '45'
  user 'root'
  command "aws s3 cp #{node['gitlab']['backup_path']}/$(date '+etc-gitlab-%F.tar') s3://#{node['gitlab']['backup_upload_remote_directory']}"
end

cron 'remove_old_backup_gitlab' do
  hour '3'
  minute '30'
  user 'root'
  command "rm -f #{node['gitlab']['backup_path']}/*"
end
