# docker_engine_install

Installs or removes Docker Engine packages.

## Actions

| Action     | Description                               |
|------------|-------------------------------------------|
| `:install` | Installs the requested packages (default) |
| `:remove`  | Removes the requested packages            |

## Properties

| Property   | Type          | Default                                                                                            | Description                   |
|------------|---------------|----------------------------------------------------------------------------------------------------|-------------------------------|
| `packages` | Array, String | `['docker-ce', 'docker-ce-cli', 'containerd.io', 'docker-buildx-plugin', 'docker-compose-plugin']` | Packages to install or remove |

## Examples

### Install from Docker's upstream repository

```ruby
docker_engine_repo 'docker'

docker_engine_install 'docker'
```

### Install a distro package instead

```ruby
docker_engine_install 'docker' do
  packages 'docker.io'
end
```
