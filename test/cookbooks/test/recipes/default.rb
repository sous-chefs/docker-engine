# frozen_string_literal: true

docker_engine_repo 'docker'

docker_engine_install 'docker'

docker_engine_config 'docker' do
  config((node['docker_engine_test'] && node['docker_engine_test']['config']) || {})
end

docker_engine_service 'docker'
