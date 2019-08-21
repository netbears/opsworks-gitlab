# frozen_string_literal: true

name             'gitlab_stack'
maintainer       'NETBEARS'
license          'All rights reserved'
description      'Installs/Configures gitlab_stack'
long_description 'Installs/Configures gitlab_stack'
version          '1.0.0'

depends 'build-essential', '~> 8.0.3'
depends 'git', '~> 8.0.1'
depends 'systemd', '~> 3.1.1'
depends 'poise-service', '~> 1.5.2'
depends 'ntp', '~> 3.5.1'
depends 'logrotate', '~> 2.2.0'
depends 'seven_zip', '~> 2.0.2'

gem 'aws-sdk', '~> 2.7'

supports 'ubuntu'
