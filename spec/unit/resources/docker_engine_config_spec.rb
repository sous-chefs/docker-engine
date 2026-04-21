# frozen_string_literal: true

require 'spec_helper'

describe 'docker_engine_config' do
  step_into :docker_engine_config
  platform 'ubuntu', '24.04'

  context 'with default properties' do
    recipe do
      docker_engine_config 'docker' do
        config(
          'log-driver' => 'json-file',
          'storage-driver' => 'vfs'
        )
      end
    end

    it { is_expected.to create_directory('/etc/docker') }
    it { is_expected.to create_file('/etc/docker/daemon.json').with(mode: '0640') }
    it { is_expected.to render_file('/etc/docker/daemon.json').with_content(/"storage-driver": "vfs"/) }
  end

  context 'with action :delete' do
    recipe do
      docker_engine_config 'docker' do
        action :delete
      end
    end

    it { is_expected.to delete_file('/etc/docker/daemon.json') }
  end
end
