# frozen_string_literal: true

name              'docker-engine'
maintainer        'Sous Chefs'
maintainer_email  'help@sous-chefs.org'
license           'Apache-2.0'
description       'Provides docker_engine_repo, docker_engine_install, docker_engine_config, and docker_engine_service resources'
source_url        'https://github.com/sous-chefs/docker-engine'
issues_url        'https://github.com/sous-chefs/docker-engine/issues'
chef_version      '>= 15.3'
version           '1.0.0'

supports 'centos_stream', '>= 9.0'
supports 'debian', '>= 12.0'
supports 'ubuntu', '>= 22.04'
