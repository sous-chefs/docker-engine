# frozen_string_literal: true

provides :docker_engine_service
unified_mode true

use '_partial/_daemon'

property :restart_on_config_change, [true, false], default: true

action :create do
  docker_service = service new_resource.service_name do
    supports status: true, reload: true, restart: true
    action %i(enable start)
  end

  docker_service.subscribes(:restart, "file[#{new_resource.config_path}]", :delayed) if new_resource.restart_on_config_change
end

action :delete do
  service new_resource.service_name do
    supports status: true, reload: true, restart: true
    action %i(stop disable)
  end
end

action :start do
  service new_resource.service_name do
    supports status: true, reload: true, restart: true
    action :start
  end
end

action :stop do
  service new_resource.service_name do
    supports status: true, reload: true, restart: true
    action :stop
  end
end

action :restart do
  service new_resource.service_name do
    supports status: true, reload: true, restart: true
    action :restart
  end
end
