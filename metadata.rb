# frozen_string_literal: true

name             'gitlab_stack'
maintainer       'NETBEARS'
license          'All rights reserved'
description      'Installs/Configures gitlab_stack'
long_description 'Installs/Configures gitlab_stack'
version          '1.0.0'

depends 'build-essential', '~> 8.0.3'
depends 'git'
depends 'systemd'
depends 'poise-service', '~> 1.5.2'
depends 'ntp', '~> 3.5.1'
depends 'logrotate', '~> 2.2.0'

gem 'aws-sdk', '~> 2.7'

supports 'ubuntu'
