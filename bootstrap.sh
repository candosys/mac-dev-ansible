#!/usr/bin/env bash
#
# Setup ansible both locally and on a remote host. Making good effort to
# get python happy on both.
#

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
SCRIPT_NAME="${0##*/}"
cd ${SCRIPT_DIR}

SETUP_TOOLS=https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py

echo
echo ${SCRIPT_NAME}:
echo This scripts bootstraps python and ansible and verifies other dependencies.
echo 
sudo -k
sudo -v -p "sudo password: "
curl -s ${SETUP_TOOLS} | sudo python
rm -rf setuptools-*
sudo easy_install --upgrade pip
sudo pip install --upgrade ansible

if [ -z $(which sshpass) ]; then
  echo You do not have sshpass, at least not in your path. It makes ansible easier to use but allows for sloppy ssh use.
  echo 
  read -p "Do you wish to install it? (y/n) " REPLY
  if [ "$REPLY" = 'y' ]; then 
    pushd /tmp
    curl -s https://dl.dropboxusercontent.com/u/2377323/sshpass-1.05.tar.gz | tar xf -
    pushd sshpass-1.05
    ./configure
    make 
    sudo make install
    popd
    rm -rf sshpass-1.05
    popd
  fi
fi


