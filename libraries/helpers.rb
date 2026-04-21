# frozen_string_literal: true

module DockerEngine
  module Helpers
    UBUNTU_CODENAMES = {
      '22.04' => 'jammy',
      '24.04' => 'noble',
      '25.10' => 'questing',
      '26.04' => 'resolute',
    }.freeze

    DEBIAN_CODENAMES = {
      '11' => 'bullseye',
      '12' => 'bookworm',
      '13' => 'trixie',
    }.freeze

    DOCKER_PACKAGES = %w(
      docker-ce
      docker-ce-cli
      containerd.io
      docker-buildx-plugin
      docker-compose-plugin
    ).freeze

    def apt_repo_uri
      "https://download.docker.com/linux/#{apt_repo_flavor}"
    end

    def apt_repo_gpg_key
      "#{apt_repo_uri}/gpg"
    end

    def apt_repo_distribution
      case node['platform']
      when 'ubuntu'
        UBUNTU_CODENAMES.fetch(node['platform_version']) do
          node.dig('lsb', 'codename') || raise("Unsupported Ubuntu version #{node['platform_version']}")
        end
      when 'debian'
        DEBIAN_CODENAMES.fetch(node['platform_version'].to_i.to_s) do
          node.dig('lsb', 'codename') || raise("Unsupported Debian version #{node['platform_version']}")
        end
      else
        raise "Unsupported APT platform #{node['platform']}"
      end
    end

    def rpm_repo_uri
      "https://download.docker.com/linux/#{rpm_repo_flavor}"
    end

    def rpm_repo_baseurl(channel)
      "#{rpm_repo_uri}/$releasever/$basearch/#{channel}"
    end

    def rpm_repo_gpg_key
      "#{rpm_repo_uri}/gpg"
    end

    def default_install_packages
      DOCKER_PACKAGES
    end

    private

    def apt_repo_flavor
      case node['platform']
      when 'ubuntu'
        'ubuntu'
      when 'debian'
        'debian'
      else
        raise "Unsupported APT platform #{node['platform']}"
      end
    end

    def rpm_repo_flavor
      case node['platform']
      when 'almalinux', 'centos', 'centos_stream', 'oracle', 'rocky'
        'centos'
      when 'redhat'
        'rhel'
      else
        raise "Unsupported RPM platform #{node['platform']}"
      end
    end
  end
end
