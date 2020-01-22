# flywait Helm Chart

This is an implementation of flywait batch job for database migrations

## Pre Requisites
* Kubernetes 1.9+

## Chart Details
This chart will do the following:
* Start a job container as post-install step to migrate 

## Migrations

We use flyway for database migrations as a job

## Configuration

The following table lists the configurable parameters of the FusionAuth chart and their default values.

Parameter | Description | Default
--- | --- | ---
`database.connectionUri` | The database host. Default is empty. | `nil`
`database.user` | The database user that will be created during configuration to own the FusionAuth schema and to connect to the database at FusionAuth runtime. Setting this environment variable will override the database.username in the Configuration file. See the Configuration Reference for more information. | `localhost`
`database.password` | The database password that will be created during configuration to own the FusionAuth schema and to connect to the database at FusionAuth runtime. If you are deploying this into production it is extremely important that you sent this value to something other than the default. Setting this environment variable will override the database.password in the Configuration file. See the Configuration Reference for more information. | `localhost`
`database.root.user` | The database root user that is used to create the FusionAuth schema and FusionAuth user. Once FusionAuth is configured and running this value is no longer used and is never persisted. | `localhost`
| `database.root.password` | The database root password that is used to create the FusionAuth schema and FusionAuth user. It is recommended to leave the value of this variable empty as it is shown in the example. Using this configuration, the value will be picked up from the host environment. To use the value in this way, be sure to set this named environment value before calling docker-compose up. Once FusionAuth is configured and running this value is no longer used and is never persisted. | `localhost`
`data` | SQL migrations that will be executed. See [values.yaml](values.yaml) for examples. | `nil`

All other user-configurable settings, default values and some commentary about them can be found in [values.yaml](values.yaml).