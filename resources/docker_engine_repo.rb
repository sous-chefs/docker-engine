# frozen_string_literal: true

provides :docker_engine_repo
unified_mode true

property :repo_name, String, name_property: true
property :channel, String, default: 'stable'

action_class do
  include DockerEngine::Helpers

  def apt_repo_file_path
    "/etc/apt/sources.list.d/#{new_resource.repo_name}.list"
  end
end

action :create do
  case node['platform_family']
  when 'debian'
    apt_update 'docker-engine-prereqs' do
      action :periodic
    end

    package %w(ca-certificates curl gnupg) do
      action :install
    end

    directory '/etc/apt/keyrings' do
      owner 'root'
      group 'root'
      mode '0755'
    end

    execute 'download docker apt gpg key' do
      command "curl -fsSL #{apt_repo_gpg_key} -o /etc/apt/keyrings/docker.asc"
      creates '/etc/apt/keyrings/docker.asc'
      notifies :update, "apt_update[#{new_resource.repo_name}]", :immediately
    end

    file '/etc/apt/keyrings/docker.asc' do
      owner 'root'
      group 'root'
      mode '0644'
    end

    file apt_repo_file_path do
      owner 'root'
      group 'root'
      mode '0644'
      content "deb [signed-by=/etc/apt/keyrings/docker.asc] #{apt_repo_uri} #{apt_repo_distribution} #{new_resource.channel}\n"
      notifies :update, "apt_update[#{new_resource.repo_name}]", :immediately
    end

    apt_update new_resource.repo_name do
      action :nothing
    end
  when 'rhel'
    yum_repository new_resource.repo_name do
      description "Docker #{new_resource.channel} repository"
      baseurl rpm_repo_baseurl(new_resource.channel)
      gpgkey rpm_repo_gpg_key
      gpgcheck true
      enabled true
      action :create
    end
  else
    raise "docker_engine_repo does not support #{node['platform']} #{node['platform_version']}"
  end
end

action :delete do
  case node['platform_family']
  when 'debian'
    file apt_repo_file_path do
      action :delete
    end

    file '/etc/apt/keyrings/docker.asc' do
      action :delete
    end
  when 'rhel'
    yum_repository new_resource.repo_name do
      action :remove
    end
  else
    raise "docker_engine_repo does not support #{node['platform']} #{node['platform_version']}"
  end
end
