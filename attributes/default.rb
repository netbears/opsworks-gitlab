# frozen_string_literal: true

default['base_packages'] = %w[
  zip
  unzip
  curl
  openssh-server
  ca-certificates
  apt-transport-https
  awscli
]
default['custom_packages']            = []

default['swap']['file']               = '/mnt/swap'
default['swap']['size']               = SwapSettings::Helper.compute_swap_amount # in MB
default['swap']['swappiness']         = 20
default['swap']['vfs_cache_pressure'] = 50

default['application'] = 'gitlab'
