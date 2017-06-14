# ALICE O2 Development Container (beta)

CentOS-based container for ALICE O2 development.

Supposedly runs aliBuild for ALICE O2 development on any docker-compatible system. 
Should be able to run simulations as well.

The container and the host machine share the `/data/sw/alice` directory. 

#### Status: 

Sucessfully runs `aliBuild --defaults o2 build O2` and `root -b`.

## Instructions

1. Install Docker
2. Build container with `./build.sh`
3. Run container with `./run.sh`
4. Build O2 with `aliBuild --defaults o2 build O2`
5. Enter alienv: `alienv enter O2/latest-dev-o2`

### Issues

* files on the host computer are owned by root
 * https://stackoverflow.com/questions/27925006/using-host-environment-variables-with-dockerfile
* cannot access X graphics server: root works only on batch mode within container: `root -b`
 * https://stackoverflow.com/questions/16296753/can-you-run-gui-apps-in-a-docker-container
 * https://stackoverflow.com/questions/25281992/alternatives-to-ssh-x11-forwarding-for-docker-containers/25334301#25334301 
 * https://stackoverflow.com/questions/26075741/starting-xserver-in-docker-ubuntu-container

