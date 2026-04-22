# docker_engine_repo

Manages the Docker upstream package repository.

## Actions

| Action    | Description                                        |
|-----------|----------------------------------------------------|
| `:create` | Configures the Docker package repository (default) |
| `:delete` | Removes the Docker package repository              |

## Properties

| Property    | Type   | Default       | Description                         |
|-------------|--------|---------------|-------------------------------------|
| `repo_name` | String | name property | Repository resource name            |
| `channel`   | String | `'stable'`    | Docker package channel to configure |

## Examples

### Basic usage

```ruby
docker_engine_repo 'docker'
```

### Configure a different channel

```ruby
docker_engine_repo 'docker' do
  channel 'test'
end
```
