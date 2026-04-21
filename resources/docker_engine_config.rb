# frozen_string_literal: true

provides :docker_engine_config
unified_mode true

use '_partial/_daemon'

property :config, Hash, default: {}
property :owner, String, default: 'root'
property :group, String, default: 'root'
property :mode, [String, Integer], default: '0640'
property :directory_mode, [String, Integer], default: '0755'

action :create do
  directory new_resource.config_directory do
    owner new_resource.owner
    group new_resource.group
    mode new_resource.directory_mode
    recursive true
  end

  file new_resource.config_path do
    content Chef::JSONCompat.to_json_pretty(new_resource.config)
    owner new_resource.owner
    group new_resource.group
    mode new_resource.mode
  end
end

action :delete do
  file new_resource.config_path do
    action :delete
  end
end
