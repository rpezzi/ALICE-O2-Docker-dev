# Alidocklite

Alidocklite is an Ubuntu 18.04-based container for building and running ALICE software. Alidocklite has been created as an alternative to [alidock](https://github.com/alidock/alidock/wiki), which is the oficial Docker approach to build ALICE software. Alidocklite is able to run aliBuild to build and execute O2 on any Docker-compatible system.

Out of the box, the workdir is configured to ~/alidocklite on the host and /home/alidocklite inside the container.

## Instructions for using alidocklite from [pre-built image from Docker Hub](https://hub.docker.com/r/rpez/alidocklite)

1. Install and configure [Docker](https://www.docker.com/community-edition).
    * Tip: Add your user to the docker group. See how to [Manage Docker as a non-root user](https://docs.docker.com/engine/installation/linux/linux-postinstall/#manage-docker-as-a-non-root-user).
    * Note: Docker runs as root. See [Docker Daemon attack surface](https://docs.docker.com/engine/security/security/#docker-daemon-attack-surface) in [Docker security](https://docs.docker.com/engine/security/security/) for more info.

2. Get alidocklite

    `$ mkdir -p ~/alice ; cd ~/alice`

    `$ git clone https://github.com/rpezzi/alidocklite.git`

3. Enter alidockdev container

    `$ cd alidocklite`

    `$ ./alidocklite`

At first run it will download Alidocklite image from DockerHub.

Inside the container you can use aliBuild and alienv to enter the desired environment, as described in [Build ALICE packages](https://alice-doc.github.io/alice-analysis-tutorial/building/build.html). Typical O2 building steps:

    `$ aliBuild init O2@dev --defaults o2`

    `$ aliBuild build O2 --defaults o2`

    `$ alienv enter O2/latest-dev-o2`

## Instructions for building alidocklite docker image from source

1. Install and configure [Docker](https://www.docker.com/community-edition).
    * Tip: Add your user to the docker group. See how to [Manage Docker as a non-root user](https://docs.docker.com/engine/installation/linux/linux-postinstall/#manage-docker-as-a-non-root-user).
    * Note: Docker runs as root. See [Docker Daemon attack surface](https://docs.docker.com/engine/security/security/#docker-daemon-attack-surface) in [Docker security](https://docs.docker.com/engine/security/security/) for more info.

2. Get alidocklite

    `mkdir -p ~/alice ; cd ~/alice`

    `$ git clone https://github.com/rpezzi/alidocklite.git alidocklite`

3. Build the container

    `$ cd alidocklite`

    `$ ./alidocklite --build`

4. Run and enter custom alidocklite container

    `$ ./alidocklite --image alidocklite_custom`

5. Stop the container with

    `$ docker stop alidocklite`

### Tips

* Create an alias to enter alidocklite with `alidocklite`. Add the following line to `.bashrc`
  * `alias alidocklite=$HOME/alice/alidocklite/alidocklite`

## Disclaimer

This project is not an official ALICE software project. Feedback is greatly appreaciated.
