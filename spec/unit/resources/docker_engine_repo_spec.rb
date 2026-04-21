# frozen_string_literal: true

require 'spec_helper'

describe 'docker_engine_repo' do
  step_into :docker_engine_repo

  context 'on ubuntu 24.04' do
    platform 'ubuntu', '24.04'

    recipe do
      docker_engine_repo 'docker'
    end

    it { is_expected.to create_file('/etc/apt/sources.list.d/docker.list') }
    it { is_expected.to run_execute('download docker apt gpg key') }
  end

  context 'on a rhel-family platform' do
    platform 'almalinux', '9'

    recipe do
      docker_engine_repo 'docker'
    end

    it { is_expected.to create_yum_repository('docker') }
  end

  context 'with action :delete on ubuntu 24.04' do
    platform 'ubuntu', '24.04'

    recipe do
      docker_engine_repo 'docker' do
        action :delete
      end
    end

    it { is_expected.to delete_file('/etc/apt/sources.list.d/docker.list') }
    it { is_expected.to delete_file('/etc/apt/keyrings/docker.asc') }
  end
end
