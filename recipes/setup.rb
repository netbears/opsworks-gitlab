# frozen_string_literal: true

execute 'apt-get update'

(node['base_packages'] + node['custom_packages']).each do |pkg|
  package pkg
end

include_recipe 'gitlab_stack::swap'
include_recipe 'gitlab_stack::gitlab'
include_recipe 'openvpn_stack::logrotate'
include_recipe 'openvpn_stack::filebeat' if node['filebeat']['enabled'] == 'true'
include_recipe 'openvpn_stack::metricbeat' if node['metricbeat']['enabled'] == 'true'
include_recipe 'ntp::default'
