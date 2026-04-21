# docker_engine_service

Manages the Docker system service.

## Actions

| Action     | Description                                   |
| ---------- | --------------------------------------------- |
| `:create`  | Enables and starts the Docker service (default) |
| `:delete`  | Stops and disables the Docker service         |
| `:start`   | Starts the Docker service                     |
| `:stop`    | Stops the Docker service                      |
| `:restart` | Restarts the Docker service                   |

## Properties

| Property                   | Type        | Default                  | Description                           |
| -------------------------- | ----------- | ------------------------ | ------------------------------------- |
| `config_directory`         | String      | `'/etc/docker'`          | Directory containing the daemon config |
| `config_path`              | String      | `'/etc/docker/daemon.json'` | Config file path to subscribe to  |
| `service_name`             | String      | `'docker'`               | System service name                  |
| `restart_on_config_change` | true, false | `true`                   | Restart when `config_path` changes   |

## Examples

### Basic usage

```ruby
docker_engine_service 'docker'
```

### Disable restart subscription

```ruby
docker_engine_service 'docker' do
  restart_on_config_change false
end
```
