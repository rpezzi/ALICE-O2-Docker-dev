# ALICE O2 Development Container

CentOS-based container for ALICE O2 development.

Supposedly runs aliBuild for ALICE O2 development on any docker-compatible system. 
Should be able to run simulations as well.

The container and the host machine share the `/data/sw/alice` directory. 

#### Status: 

Sucessfully build O2 and runs root in batch mode. See issues bellow.

## Instructions

### Option 1: Use existing docker image

1. Install Docker
2. Pull Alice O2 Develpment container 
     `docker pull rpez/aliceo2dev`
3. Run 
    `docker run -it -v /data/sw/alice:/data/sw/alice rpez/aliceo2dev`
4. Get aliBuild 
    `git clone https://github.com/alisw/alibuild`
5. Build O2 
    `aliBuild --defaults o2 build O2`
6. Enter alienv: 
     `alienv enter O2/latest-dev-o2`
7. Enjoy

__Note:__ Steps 4 to 6 are executed inside the container started on step 3.

### Option 2: Build the image

1. Install and configure Docker
2. Download the repository
    `git clone https://github.com/rpezzi/ALICE-O2-Docker-dev.git`
3. Build container with 
    `./build.sh`
4. Run container with 
    `./run.sh`
5. Build O2 with 
    `aliBuild --defaults o2 build O2`
6. Enter alienv: 
    `alienv enter O2/latest-dev-o2`
7. Enjoy

__Note:__ Steps 5 and 6 are run inside the container.

### Issues

* files on the host computer are owned by root
 * https://stackoverflow.com/questions/27925006/using-host-environment-variables-with-dockerfile
* cannot access X graphics server: root works only on batch mode within container: `root -b`
 * https://stackoverflow.com/questions/16296753/can-you-run-gui-apps-in-a-docker-container
 * https://stackoverflow.com/questions/25281992/alternatives-to-ssh-x11-forwarding-for-docker-containers/25334301#25334301 
 * https://stackoverflow.com/questions/26075741/starting-xserver-in-docker-ubuntu-container

