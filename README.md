# docker-engine

This cookbook aim to install _docker-engine_ and to configure it.

If you want to manipulate docker from chef recipes you can use [docker](https://github.com/chef-cookbooks/docker) cookbook

## Recipes

### `default`

`install` and launch `service`

### `install`

Install _docker-engine_  according to `node['docker-engine']['install']['method']`

### `install_package`

Install _docker-engine_ via packages

### `install_repo`

Install _docker.io_ repositories for distributions

### `service`

Enable and run _docker-engine_ service
