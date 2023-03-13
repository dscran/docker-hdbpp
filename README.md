# docker-hdbpp
docker container to provide HDB++ archiving for existing tango control system


## build

`docker compose build`

## run

create `.env` file with following contents:

```
TANGO_HOST=<your_tango_host>:<port>
OMNIORB_PUBLISH=<docker_host>
DATAFOLDER=<local_hdbpp_data_folder>
```

`docker compose up`


## configure

* for now, devices need to be created manually, e.g. via jive device wizard
 * configuration manager:
  * server name: hdb++cm-srv
  * instance name: 1
  * device path: `archiving/hdbpp/cm1`
  * Properties:
   * ArchiverList: `tango://<your_tango_host>:<port>/archiving/hdbpp/es1`
   * LibConfiguration: (see below)
 * event subscriber:
  * server name: hdb++es-srv
  * instance name: 1
  * device path: `archiving/hdbpp/es1`
  * Properties:
   * LibConfiguration: (see below)

### LibConfiguration

```
host=hdbpp-db
user=hdbpprw
password=hdbpprw
dbname=hdbpp
port=3306
ignore_duplicates=1
json_array=1
batch_size=10000
libname=libhdb++mysql.so
```

## java GUI tools

* `hdbpp-configurator` needs environment variable `HdbManager=archiving/hdbpp/cm1`


