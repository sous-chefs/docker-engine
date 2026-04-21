# frozen_string_literal: true

require 'spec_helper'

describe 'docker_engine_service' do
  step_into :docker_engine_service
  platform 'ubuntu', '24.04'

  context 'with default properties' do
    recipe do
      file '/etc/docker/daemon.json'

      docker_engine_service 'docker'
    end

    it { is_expected.to enable_service('docker') }
    it { is_expected.to start_service('docker') }

    it 'restarts when daemon.json changes' do
      expect(chef_run.service('docker')).to subscribe_to('file[/etc/docker/daemon.json]').on(:restart).delayed
    end
  end

  context 'with action :delete' do
    recipe do
      docker_engine_service 'docker' do
        action :delete
      end
    end

    it { is_expected.to stop_service('docker') }
    it { is_expected.to disable_service('docker') }
  end
end
