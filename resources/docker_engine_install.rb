# frozen_string_literal: true

provides :docker_engine_install
unified_mode true

property :packages, [Array, String],
         coerce: proc { |value| Array(value) },
         default: lazy { DockerEngine::Helpers::DOCKER_PACKAGES.dup }

action :install do
  new_resource.packages.each do |package_name|
    package package_name do
      action :install
    end
  end
end

action :remove do
  new_resource.packages.reverse_each do |package_name|
    package package_name do
      action :remove
    end
  end
end
