#
# Cookbook Name:: docker-engine
# Recipe:: install_repo
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

node.default['docker-engine']['install']['package']['name'] = 'docker-engine'

case node['platform_family']
when 'debian'
  apt_repository 'docker' do
    uri 'https://apt.dockerproject.org/repo'
    distribution "#{node['platform']}-#{node['lsb']['codename']}"
    components ['main']
    key '58118E89F3A912897C070ADBF76221572C52609D'
  end
when 'rhel'
  yum_repository 'docker' do
    description 'Docker Repository'
    baseurl "https://yum.dockerproject.org/repo/main/centos/#{node['platform_version'].split('.').first}/"
    gpgkey 'https://yum.dockerproject.org/gpg'
    action :create
  end
else
  raise 'Distribution not supported by docker-engine::install_repo'
end
