# GPII Flow Manager Dockerfile - Ansible version

Builds a GPII Preferences Server Docker container image. This image is built using the [Ansible role](https://github.com/gpii-ops/ansible-flow-manager).

## Building

- build Ansible-provisioned image:
  - `docker build --no-cache -t gpii/flow-manager .`

## Runtime Environment Variables

- `PREFERENCES_SERVER_HOST_ADDRESS`: host address of the preferences server instance to use. (default: `preferences.gpii.net`)
- `NODE_ENV`: specifies the configuration file to be used from https://github.com/GPII/universal/tree/master/gpii/configs when launching (default: `cloudBased.production`)
- `CONTAINER_TEST`: whether or not to run the container in test mode, then exit (default: `false`)

## Testing

The container can be tested as part of a GPII deployment by setting the *CONTAINER_TEST* environment variable to *true*.

This mode is expected to connect to a running preferences server with the 'Carla' test data set. The container will exit after the test and the exit code as a reuslt of the run command can be used for further actions.

## Running

- running requires a preferences server instance accessible to the container. As in the example below, this can be a self-contained preferences server running in the same container in development mode.

### Run Examples

#### Connecting to a separate preferences server in another container

- `docker run --name flowmanager -d -p 8081:8081 -l prefserver -e NODE_ENV=cloudBased.production -e PREFERENCES_SERVER_HOST_ADDRESS=prefserver:8082 gpii/flow-manager`

#### In test mode, connecting to a separate preferences server in another container

- `docker run --name flowmanagertest -t --rm -e NODE_ENV=cloudBased.production -e PREFERENCES_SERVER_HOST_ADDRESS=prefserver:8082 -e CONTAINER_TEST=true -t gpii/flow-manager`

### With a self-contained preferences server running in the same container(development mode)

- `docker run --name flowmanager -d -p 8081:8081 -l prefserver -e NODE_ENV=cloudBased.development.all.local -e PREFERENCES_SERVER_HOST_ADDRESS=localhost:8081 -t gpii/flow-manager`

### In test mode, connecting to its own self-contained preferences server

- `docker run --name flowmanagertest -t --rm -e NODE_ENV=cloudBased.development.all.local -e PREFERENCES_SERVER_HOST_ADDRESS=localhost:8081 -e CONTAINER_TEST=true -t gpii/flow-manager`
