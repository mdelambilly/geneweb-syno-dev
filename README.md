# geneweb-syno-dev

A docker image to develop on [geneweb](https://github.com/geneweb/geneweb) on a SYNOLOGY NAS

To use it :
1. Copy the two files in a directory on your docker host
2. Connect to guacamomle using your local admin account (not root !), go to this directory and run the following commands
   * sudo docker build --tag geneweb-dev --file geneweb-dev.yml --force-rm --build-arg uid=$(id -u) .<br>
     id -u is used to link your local admin user to the opan container user to share geneweb dev directory
   * sudo docker run -it -p <a host port>:2316 -p <a host port>:2317 -v <a host directory>:/home/opam/geneweb --name geneweb-dev geneweb-dev <br>
     wait few minutes to the container to initialized itself

All the geneweb develpment files will be in the host directory you provided. You can modify them from your host.
To compile just start the container and compile:
* sudo docker start -i geneweb-dev
* make clean distrib

to run command on your nas, you can install a docker image of [Apache guacamole](https://guacamole.apache.org/) by using this [tuto](https://www.wundertech.net/synology-nas-apache-guacamole-setup-instructions/) or this [one](https://mariushosting.com/how-to-install-guacamole-on-your-synology-nas/)
