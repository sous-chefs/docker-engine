name 'docker-engine'
maintainer 'The Authors'
maintainer_email 'guilhem@lettron.fr'
license 'apachev2'
description 'Installs/Configures docker-engine'
long_description 'Installs/Configures docker-engine'
version '0.1.0'

issues_url 'https://github.com/redguide/docker-engine/issues' if respond_to?(:issues_url)
source_url 'https://github.com/redguide/docker-engine' if respond_to?(:source_url)

chef_version '>= 12.14'

supports 'ubuntu'
supports 'centos'
