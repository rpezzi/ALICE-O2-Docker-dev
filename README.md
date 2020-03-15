# alidocklite - Ubuntu-based ALICE O2 Development Container

Ubuntu 18.04-based container for ALICE O2 development. This docker container has been created as an alternative to [alidock](https://github.com/alidock/alidock/wiki), which is the oficial Docker approach to build ALICE software.

This container runs aliBuild for ALICE O2 development on any docker-compatible system.

Out of the box, the workdir is configured to ~/alidocklite_ubuntu18.04 on the host and /home/alidocklite side the container.

## Instructions

### Option 1: Build the Docker image from source

1. Install and configure [Docker](https://www.docker.com/community-edition).
    * Tip: Add your user to the docker group. See how to [Manage Docker as a non-root user](https://docs.docker.com/engine/installation/linux/linux-postinstall/#manage-docker-as-a-non-root-user).
    * Note: Docker runs as root. See [Docker Daemon attack surface](https://docs.docker.com/engine/security/security/#docker-daemon-attack-surface) in [Docker security](https://docs.docker.com/engine/security/security/) for more info.

2. Download alidocklite image source-code repository

    `cd ~/alice`

    `$ git clone https://github.com/rpezzi/alidocklite.git alidocklite`

3. Build container

    `$ cd alidocklite`

    `$ ./build.sh`

4. Run container

    `$ ./run.sh`

Inside the container you can use aliBuild and user alienv to enter the desired environment, as described in [Build ALICE packages](https://alice-doc.github.io/alice-analysis-tutorial/building/build.html).  

5. Stop the container with

    `$ docker stop alidocklite`

#### Tips

* Add an alias to enter alidocklite to `.bashrc`
  * `alias alidocklite=$HOME/alice/alidocklite/run.sh`

### Option 2: Use existing docker image

TODO
