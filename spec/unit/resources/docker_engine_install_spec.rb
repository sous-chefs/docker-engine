# frozen_string_literal: true

require 'spec_helper'

describe 'docker_engine_install' do
  step_into :docker_engine_install
  platform 'ubuntu', '24.04'

  context 'with default packages' do
    recipe do
      docker_engine_install 'docker'
    end

    %w(docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin).each do |package_name|
      it { is_expected.to install_package(package_name) }
    end
  end

  context 'with custom distribution package override' do
    recipe do
      docker_engine_install 'docker' do
        packages 'docker.io'
      end
    end

    it { is_expected.to install_package('docker.io') }
  end

  context 'with action :remove' do
    recipe do
      docker_engine_install 'docker' do
        action :remove
      end
    end

    it { is_expected.to remove_package('docker-compose-plugin') }
    it { is_expected.to remove_package('docker-ce') }
  end
end
