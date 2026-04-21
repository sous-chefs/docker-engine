# docker_engine_config

Manages `/etc/docker/daemon.json`.

## Actions

| Action    | Description                                                |
| --------- | ---------------------------------------------------------- |
| `:create` | Creates or updates the Docker daemon configuration (default) |
| `:delete` | Removes the Docker daemon configuration file               |

## Properties

| Property         | Type            | Default                  | Description                                |
| ---------------- | --------------- | ------------------------ | ------------------------------------------ |
| `config_directory` | String        | `'/etc/docker'`          | Directory containing the daemon config     |
| `config_path`    | String          | `'/etc/docker/daemon.json'` | Path to the daemon config file          |
| `service_name`   | String          | `'docker'`               | Service name paired with this config       |
| `config`         | Hash            | `{}`                     | Hash rendered to JSON in `daemon.json`     |
| `owner`          | String          | `'root'`                 | Owner for the config directory and file    |
| `group`          | String          | `'root'`                 | Group for the config directory and file    |
| `mode`           | String, Integer | `'0640'`                 | File mode for `daemon.json`                |
| `directory_mode` | String, Integer | `'0755'`                 | Mode for the config directory              |

## Examples

### Basic usage

```ruby
docker_engine_config 'docker' do
  config('storage-driver' => 'overlay2')
end
```

### Custom config path

```ruby
docker_engine_config 'docker' do
  config_path '/etc/docker/custom-daemon.json'
  config('log-driver' => 'journald')
end
```
