default['docker-engine']['install']['method'] = 'package'

default['docker-engine']['install']['package']['name'] = value_for_platform_family(
  'debian' => 'docker.io',
  'rhel' => 'docker'
)

default['docker-engine']['install']['repo'] = false
