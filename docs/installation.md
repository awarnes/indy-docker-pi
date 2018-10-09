Installing should be relatively painless.

Clone the repo, make sure the dependencies below are installed and start everything up with the [boot-up](../bin/boot-up.sh) script.

The system is setup to run on either a raspberry pi or a mac. If other systems are required please put in a pull request!

Requirements:
  - docker
    - [mac](https://docs.docker.com/v17.12/docker-for-mac/install/)
    - [raspberry pi](https://www.raspberrypi.org/blog/docker-comes-to-raspberry-pi/)
  - docker-compose
    - mac (it comes with docker for mac installed above!)
    - [raspberry pi](#docker-compose-for-arm)
  - [jq](https://stedolan.github.io/jq/download/)

## [Docker compose for ARM](#docker-compose-for-arm):
https://www.berthon.eu/2017/getting-docker-compose-on-raspberry-pi-arm-the-easy-way/
```
$ git clone https://github.com/docker/compose.git
$ cd compose
$ git checkout release
$ docker build -t docker-compose:armhf -f Dockerfile.armhf .
$ docker run --rm --entrypoint="script/build/linux-entrypoint" -v $(pwd)/dist:/code/dist -v $(pwd)/.git:/code/.git "docker-compose:armhf"
$ ls -l dist/
$ sudo cp dist/docker-compose-Linux-armv7l /usr/local/bin/docker-compose
$ sudo chown root:root /usr/local/bin/docker-compose
$ sudo chmod 0755 /usr/local/bin/docker-compose
$ docker-compose version
```

Docker compose bash auto completion:
```
$ sudo curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
```