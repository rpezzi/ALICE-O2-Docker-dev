# ALICE O2 Development Container

CentOS-based container for ALICE O2 development.

Supposedly runs aliBuild for ALICE O2 development on any docker-compatible system. 
Should be able to run simulations as well.

The container and the host machine share the `/data/sw/alice` directory. 

#### Status: 

Sucessfully build O2 and runs root in batch mode. See issues bellow.

## Instructions

### Option 1: Use existing docker image

1. Install and configure (Docker)[https://www.docker.com/community-edition]. 
    * Tip: Add your user to the docker group. See how to (Manage Docker as a non-root user)[https://docs.docker.com/engine/installation/linux/linux-postinstall/#manage-docker-as-a-non-root-user].
    * Note: Docker runs as root. See (docker security)[https://docs.docker.com/engine/security/security/] for more info.

2. Pull Alice O2 Development Docker image 

    `$ docker pull rpez/aliceo2dev`

3. Ensure that the workdir is owned by the current user. 

    `$ sudo mkdir -p /data/sw/alice`
     
    `$ sudo chown -R $USER /data/sw`

4. Run the container

    `$ docker run -it -v /data/sw/alice:/data/sw/alice rpez/aliceo2dev`

5. Get aliBuild 

    `$ git clone https://github.com/alisw/alibuild`

6. Build O2 

    `$ aliBuild --defaults o2 build O2`

7. Enter alienv: 

    `$ alienv enter O2/latest-dev-o2`

8. Enjoy

__Note:__ Steps 5 to 7 must be executed inside the container started on step 4.

### Option 2: Build the Docker image from source

1. Install and configure (Docker)[https://www.docker.com/community-edition]. 
    * Tip: Add your user to the docker group. See how to (Manage Docker as a non-root user)[https://docs.docker.com/engine/installation/linux/linux-postinstall/#manage-docker-as-a-non-root-user].
    * Note: Docker runs as root. See (docker security)[https://docs.docker.com/engine/security/security/] for more info.

2. Download the ALICE-O2-Docker-dev image source-code repository

    `$ git clone https://github.com/rpezzi/ALICE-O2-Docker-dev.git`

3. Build container

    `$ cd ALICE-O2-Docker-dev` 

    `$ ./build.sh`

4. Ensure that Alice workdir is owned by the current user.

    `$ sudo mkdir -p /data/sw/alice`

    `$ sudo chown -R $USER /data/sw`
 
5. Run container with 

    `$ ./run.sh`

6. Build O2 with aliBuild

    `$ git clone https://github.com/alisw/alibuild`

    `$ aliBuild --defaults o2 build O2`

7. Enter alienv: 

    `$ alienv enter O2/latest-dev-o2`

8. Enjoy

__Note:__ Steps 6 and 7 must be run inside the container started on step 5.


### Issues

* files on the host computer are usually owned by root when created by a Docker container. This limitation has been solved by adding setuser and wrapper scripts to the container. This will identify the owner of the workdir and execute all commands with the same UID.
     * Tip found [here](https://stackoverflow.com/questions/27925006/using-host-environment-variables-with-dockerfile)

* cannot access X graphics server: root works only on batch mode within container: `root -b`
     * https://stackoverflow.com/questions/16296753/can-you-run-gui-apps-in-a-docker-container
     * https://stackoverflow.com/questions/25281992/alternatives-to-ssh-x11-forwarding-for-docker-containers/25334301#25334301
     * https://stackoverflow.com/questions/26075741/starting-xserver-in-docker-ubuntu-container
