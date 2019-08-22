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

default['application'] = 'gitlab'
