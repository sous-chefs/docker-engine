name 'docker-engine'
maintainer 'The Authors'
maintainer_email 'guilhem@lettron.fr'
license 'apachev2'
description 'Installs/Configures docker-engine'
long_description 'Installs/Configures docker-engine'
version '0.1.0'

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Issues` link
# issues_url 'https://github.com/<insert_org_here>/docker-engine/issues' if respond_to?(:issues_url)

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Source` link
# source_url 'https://github.com/<insert_org_here>/docker-engine' if respond_to?(:source_url)

supports 'ubuntu'
supports 'debian'
supports 'centos'

depends 'compat_resource', '>= 12.14.6'
