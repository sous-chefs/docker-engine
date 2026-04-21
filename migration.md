# Migration Guide

This cookbook migrated from root-level recipes and attributes to custom resources.

## Breaking change

This is a breaking change for operators upgrading from older cookbook versions. Any wrapper cookbook, role, Policyfile, or node configuration that still includes `docker-engine::*` recipes or sets `node['docker-engine']` attributes must be updated before the upgraded cookbook will converge successfully.

## What changed

* `attributes/` and `recipes/` were removed.
* The public interface is now:
  * `docker_engine_repo`
  * `docker_engine_install`
  * `docker_engine_config`
  * `docker_engine_service`
* Configuration that previously lived in node attributes now belongs on resource properties.

## How to migrate

Replace recipe inclusion with explicit resource declarations. Do not expect the old recipe and attribute interface to remain backward compatible.

Legacy pattern:

```ruby
include_recipe 'docker-engine::install'
include_recipe 'docker-engine::config'
include_recipe 'docker-engine::service'
```

Resource-first pattern:

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

## Attribute migration

If you previously set cookbook attributes for package selection or daemon settings, move those values into the resource blocks:

* repository setup goes on `docker_engine_repo`
* package selection goes on `docker_engine_install`
* daemon JSON settings go on `docker_engine_config`
* service behavior goes on `docker_engine_service`

## Important note

Upstream Docker packaging changed since the legacy cookbook was written. See [LIMITATIONS.md](LIMITATIONS.md) for the current package and repository constraints that shaped this migration.
