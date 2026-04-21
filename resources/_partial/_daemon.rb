# frozen_string_literal: true

property :config_directory, String, default: '/etc/docker'
property :config_path, String, default: lazy { ::File.join(config_directory, 'daemon.json') }
property :service_name, String, default: 'docker'
