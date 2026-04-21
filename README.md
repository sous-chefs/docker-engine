# docker-engine

[![Cookbook Version](https://img.shields.io/cookbook/v/docker-engine.svg)](https://supermarket.chef.io/cookbooks/docker-engine)
[![CI State](https://github.com/sous-chefs/docker-engine/actions/workflows/ci.yml/badge.svg)](https://github.com/sous-chefs/docker-engine/actions/workflows/ci.yml)
[![OpenCollective](https://opencollective.com/sous-chefs/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/sous-chefs/sponsors/badge.svg)](#sponsors)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

Custom resources for installing Docker Engine, managing `/etc/docker/daemon.json`, and controlling the `docker` service.

## Breaking Change for Upgrades

Upgrading from older `docker-engine` cookbook releases is a breaking change. Legacy usage based on `include_recipe 'docker-engine::...'` and cookbook attributes under `node['docker-engine']` is no longer supported. Update wrapper cookbooks, roles, and Policyfiles to declare the `docker_engine_*` resources directly before upgrading.

See [migration.md](migration.md) for the required migration steps.

## Resources

* `docker_engine_repo`
* `docker_engine_install`
* `docker_engine_config`
* `docker_engine_service`

## Usage

### Install Docker Engine from Docker's upstream repository

```ruby
docker_engine_repo 'docker'

docker_engine_install 'docker'

docker_engine_config 'docker' do
  config(
    'log-driver' => 'json-file',
    'storage-driver' => 'overlay2'
  )
end

docker_engine_service 'docker'
```

### Install from distro packages instead of Docker's upstream repository

```ruby
docker_engine_install 'docker' do
  packages 'docker.io'
end

docker_engine_config 'docker' do
  config('storage-driver' => 'overlay2')
end

docker_engine_service 'docker'
```

## Resource Documentation

* [docker_engine_repo](documentation/docker_engine_repo.md)
* [docker_engine_install](documentation/docker_engine_install.md)
* [docker_engine_config](documentation/docker_engine_config.md)
* [docker_engine_service](documentation/docker_engine_service.md)

## Supported Platforms

* CentOS Stream 9+
* Debian 12+
* Ubuntu 22.04+

See [LIMITATIONS.md](LIMITATIONS.md) for the current upstream Docker package and repository constraints that shaped this migration.

## Contributors

This project exists thanks to all the people who [contribute.](https://opencollective.com/sous-chefs/contributors.svg?width=890&button=false)

### Backers

Thank you to all our backers!

![https://opencollective.com/sous-chefs#backers](https://opencollective.com/sous-chefs/backers.svg?width=600&avatarHeight=40)

### Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website.

![https://opencollective.com/sous-chefs/sponsor/0/website](https://opencollective.com/sous-chefs/sponsor/0/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/1/website](https://opencollective.com/sous-chefs/sponsor/1/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/2/website](https://opencollective.com/sous-chefs/sponsor/2/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/3/website](https://opencollective.com/sous-chefs/sponsor/3/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/4/website](https://opencollective.com/sous-chefs/sponsor/4/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/5/website](https://opencollective.com/sous-chefs/sponsor/5/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/6/website](https://opencollective.com/sous-chefs/sponsor/6/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/7/website](https://opencollective.com/sous-chefs/sponsor/7/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/8/website](https://opencollective.com/sous-chefs/sponsor/8/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/9/website](https://opencollective.com/sous-chefs/sponsor/9/avatar.svg?avatarHeight=100)
