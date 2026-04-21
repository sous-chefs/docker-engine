# frozen_string_literal: true

require_relative '../../spec_helper'

control 'docker-engine-install-01' do
  impact 1.0
  title 'docker CLI is installed'

  describe command('docker --version') do
    its('exit_status') { should eq 0 }
  end
end

control 'docker-engine-config-01' do
  impact 0.7
  title 'daemon.json is rendered with the requested configuration'

  describe file(docker_config_path) do
    it { should exist }
    its('mode') { should cmp '0640' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
  end

  describe json(docker_config_path) do
    its(['storage-driver']) { should cmp 'vfs' }
  end
end

control 'docker-engine-service-01' do
  impact 1.0
  title 'docker service is enabled and running'

  describe systemd_service('docker') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end

  describe file('/var/run/docker.sock') do
    it { should exist }
    it { should be_socket }
  end
end
