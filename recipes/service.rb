#
# Cookbook Name:: docker-engine
# Recipe:: service
#

service node['docker-engine']['service']['name'] do
  supports status: true, reload: true
  action [:enable, :start]
  subscribes :restart, 'file[/etc/docker/daemon.json]'
end
