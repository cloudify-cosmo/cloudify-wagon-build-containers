# cloudify-wagon-builders

  - Centos6 is available [here](https://hub.docker.com/r/cloudifyplatform/cloudify-centos-6-wagon-builder).
  - Centos7 is available [here](https://hub.docker.com/r/cloudifyplatform/cloudify-centos-7-wagon-builder).
  - Ubuntu-12-04 is available [here](https://hub.docker.com/r/cloudifyplatform/cloudify-ubuntu-12-04-wagon-builder).
  - Ubuntu-14-04 is available [here](https://hub.docker.com/r/cloudifyplatform/cloudify-ubuntu-14-04-wagon-builder).
  - RedHat: In order to build a RedHat docker image the following steps must be done:
      - Get a developer account from [here](https://developers.redhat.com/)
      - Prepare username & password for the created account to use later on when build the image `USERNAME` & `PASSWORD`
      

### Docker Image Build

1. Centos6 | Centos7 | Ubuntu-12-04 |  Ubuntu-14-04: Run 

```shell
docker build -t cloudify-${image-name}-wagon-builder . 
```    

2. RedHat: Run 

```shell 
docker build -t cloudify-redhat-wagon-builder --build-arg USERNAME="<USERNAME>" --build-arg PASSWORD="<PASSWORD>" .
```


### Usage

You can build the wagon by mounting your plugin directory in the Docker container, for example:

```shell
docker run \
  -v ~/dev/repos/cloudify-openstack-plugin/:/packaging \
  cloudifyplatform/cloudify-${image-name}-wagon-builder
```

The wagon will then be found in that plugin directory:

```shell
ls ~/dev/repos/cloudify-openstack-plugin
-rw-r--r-- 1 vagrant vagrant  5878 May 22 08:53 CHANGELOG.txt
drwxr-xr-x 1 vagrant vagrant   256 Mar 19 09:26 cloudify_openstack_plugin.egg-info
-rw-r--r-- 1 vagrant vagrant 12516269 Jun  2 08:31 cloudify-openstack-plugin-3.1.1-py27-none-linux_x86_64-centos-Core.wgn
-rw-r--r-- 1 vagrant vagrant  9290 May 22 08:53 compat.yaml
drwxr-xr-x 1 vagrant vagrant  1472 Mar 19 09:27 cover
-rw-r--r-- 1 vagrant vagrant    22 Apr 14 09:58 dev-requirements.txt
drwxr-xr-x 1 vagrant vagrant   224 May 22 08:53 examples
drwxr-xr-x 1 vagrant vagrant   416 May 22 08:53 openstack_plugin
drwxr-xr-x 1 vagrant vagrant   256 May 22 08:53 openstack_sdk
-rw-r--r-- 1 vagrant vagrant 58591 May 22 08:53 plugin.yaml
-rw-r--r-- 1 vagrant vagrant   226 Apr 14 09:58 README.md
-rw-r--r-- 1 vagrant vagrant  1084 May 22 08:53 setup.py
-rw-r--r-- 1 vagrant vagrant   106 May 22 08:53 test-requirements.txt
-rw-r--r-- 1 vagrant vagrant   610 Apr 14 09:58 tox.ini
```

### Extra Packaging Instructions

You can add extra packaging instructions to your plugin build by adding a script in the plugin directory named `extra-packaging-instructions.sh`. This file will be `source`-ed before the wagon is biult.
