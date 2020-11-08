# cloudify-wagon-builders

  For python 2 wagon builders:
  - Centos6 is available [here](https://hub.docker.com/r/cloudifyplatform/cloudify-centos-6-wagon-builder).
  - Centos7 is available [here](https://hub.docker.com/r/cloudifyplatform/cloudify-centos-7-py2-wagon-builder).
  - Ubuntu-12-04 is available [here](https://hub.docker.com/r/cloudifyplatform/cloudify-ubuntu-12-04-wagon-builder).
  - Ubuntu-14-04 is available [here](https://hub.docker.com/r/cloudifyplatform/cloudify-ubuntu-14-04-py2-wagon-builder).
  - Ubuntu-16-04 is available [here](https://hub.docker.com/r/cloudifyplatform/cloudify-ubuntu-16-04-py2-wagon-builder).
  - Ubuntu-18-04 is available [here](https://hub.docker.com/r/cloudifyplatform/cloudify-ubuntu-18-04-py2-wagon-builder).

  For python 3 wagon builders:
  - Centos6-py3 is available [here](https://hub.docker.com/r/cloudifyplatform/cloudify-centos-6-py3-wagon-builder).
  - Centos7-py3 is available [here](https://hub.docker.com/r/cloudifyplatform/cloudify-centos-7-py3-wagon-builder).
  - Ubuntu-12-04-py3 is available [here](https://hub.docker.com/r/cloudifyplatform/cloudify-ubuntu-12-04-py3-wagon-builder).
  - Ubuntu-14-04-py3 is available [here](https://hub.docker.com/r/cloudifyplatform/cloudify-ubuntu-14-04-py3-wagon-builder).
  - Ubuntu-16-04-py3 is available [here](https://hub.docker.com/r/cloudifyplatform/cloudify-ubuntu-16-04-py3-wagon-builder).
  - Ubuntu-18-04-py3 is available [here](https://hub.docker.com/r/cloudifyplatform/cloudify-ubuntu-18-04-py3-wagon-builder).  

  For python 2 python 3(py2py3) wagon builders:
  - Centos7-py2py3 is available [here](https://hub.docker.com/r/cloudifyplatform/cloudify-centos-7-py2py3-wagon-builder).
  - Ubuntu-14-04-py2py3 is available [here](https://hub.docker.com/r/cloudifyplatform/cloudify-ubuntu-14-04-py2py3-wagon-builder).  
  - Ubuntu-16-04-py2py3 is available [here](https://hub.docker.com/r/cloudifyplatform/cloudify-ubuntu-16-04-py2py3-wagon-builder). 
  - Ubuntu-18-04-py2py3 is available [here](https://hub.docker.com/r/cloudifyplatform/cloudify-ubuntu-18-04-py2py3-wagon-builder).  
  
  For RedHat wagon builders:
   - In order to build a RedHat docker image the following steps must be done:
      - Get a developer account from [here](https://developers.redhat.com/)
      - Prepare username & password for the created account to use later on when build the image `USERNAME` & `PASSWORD`

**Notes**:
 - py2py3 wagon builders are used for both python2 managers(5.0.5 and older) and python3 managers(5.1.0 and newer). 
 - For Ubuntu, if 5.1.0 manager or newer is used, use py2py3 wagon builder, else use py2 wagon builders.
 
### Docker Image Build

1. Centos6 | Centos7 | Ubuntu-12-04 |  Ubuntu-14-04 | Ubuntu-16-04 | Ubuntu-18-04 : Run

```shell
docker build -t cloudify-${image-name}-wagon-builder .
```    

for python 3 builders:
```shell
docker build -t cloudify-${image-name}-py3-wagon-builder .
```    

for python 2 python 3 builders:
```shell
docker build -t cloudify-${image-name}-py2py3-wagon-builder .
```    

2. RedHat: Run

```shell
docker build -t cloudify-redhat-wagon-builder --build-arg USERNAME="<USERNAME>" --build-arg PASSWORD="<PASSWORD>" .
```


### Usage

You can build the wagon by mounting your plugin directory in the Docker container, for example:

```shell
docker run -v ~/dev/src/cloudify-cosmo/cloudify-aws-plugin/:/packaging cloudifyplatform/cloudify-centos-7-py2py3-wagon-builder
```

The wagon will then be found in that plugin directory:

```shell
ll ~/dev/src/cloudify-cosmo/cloudify-aws-plugin
drwxr-xr-x 13 usr usr       4096 Nov  8 10:18 ./
drwxr-xr-x 48 usr usr       4096 Oct 22 17:40 ../
-rw-r--r--  1 usr usr       3060 Jul  8 19:46 CHANGELOG.txt
drwxr-xr-x  2 usr usr       4096 Mar  3  2020 .cicd/
drwxr-xr-x  2 usr usr       4096 Jul  8 19:45 .circleci/
drwxr-xr-x 20 usr usr       4096 Mar 17  2020 cloudify_aws/
-rw-r--r--  1 root root   39485868 Nov  8 10:18 cloudify_aws_plugin-2.4.0-centos-Core-py27.py36-none-linux_x86_64.wgn
-rw-rw-r--  1 usr usr          0 May 17 13:28 constraints.txt
.
.
.
-rw-r--r--  1 adar adar        613 Jul  7 12:38 tox.ini

```

### Extra Packaging Instructions

You can add extra packaging instructions to your plugin build by adding a script in the plugin directory named `extra-packaging-instructions.sh`. This file will be `source`-ed before the wagon is built.
