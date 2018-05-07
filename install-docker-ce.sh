#! /bin/bash 

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# remove any existing installation
sudo yum remove docker docker-common docker-selinux docker-engine

# add yum repository 
# note that starting from docker-ce 17.06, docker team decided to keep RHEL users from installing community edition, 
# so that they and redhat can make money from them.
# this repository only have docker-ce up to 17.05
sudo cp $SCRIPT_DIR/docker.repo /etc/yum.repos.d/

# update repo cache and install docker
sudo yum makecache fat && sudo yum install docker-engine docker-engine-selinux

# start docker as a system service
sudo systemctl start docker

# add users to docker group so they can use docker commands without sudoing
# current user would always be added, and additional user can be passed as arguments
while [ $# -gt 0 ]; do 
    sudo usermode -aG docker $USER
    if [ $1 != $USER ] ; then 
        sudo usermod -aG docker $1
    fi
    shift
done

# test everything 
docker run hello-world
