#
# Cookbook Name:: docker-engine
# Recipe:: install
#

include_recipe "docker-engine::install_#{node['docker-engine']['install']['method']}"
