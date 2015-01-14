## GPII Flow Manager Dockerfile


This repository is used to build [GPII Flow Manager](http://wiki.gpii.net/w/Architecture_Overview#Flow_Manager) Docker images.


### Environment Variables

The following environment variables can be used to affect the container's behaviour:

* `NODE_ENV` - setting this variable is required and there is no default, one possible option is `cloudBased.production`

* `PREFERENCES_SERVER_HOST_ADDRESS` - this is optional and defaults to `preferences.gpii.net` 

* `RBMM_HOST_ADDRESS` - this is optional and defaults to `rbmm.gpii.net` 

* `STMM_HOST_ADDRESS` - this is optional and defaults to `stmm.gpii.net` 


### Port(s) Exposed

* `8081 TCP`


### Base Docker Image

* [gpii/universal](https://github.com/gpii-ops/docker-universal/)


### Download

    docker pull gpii/flow-manager


#### Run `flow_manager`

If your Preferences Server instance uses a `10.0.2.15` IP address and `8082` TCP port you could start a container like this:

```
docker run \
-d \
--rm=true \
--name="flow_manager" \
-p 8081:8081 \
-e NODE_ENV="cloudBased.production" \
-e PREFERENCES_SERVER_HOST_ADDRESS="10.0.2.15:8082" \
gpii/flow-manager
```


### Build your own image

    docker build --rm=true -t <your name>/flow_manager .
