#!/bin/bash -e
type=ed25519
keyname=ubuntu20


current_dir=$(pwd)

echo "--------------------------------------"
echo " Local PC UserName?"
echo "--------------------------------------"
read LOCALNAME

if [ -e /home/$USER/.ssh/ ]; then
  echo ".ssh is found"
else
  echo '.ssh is NOT FOUND'
  mkdir -p /home/$USER/.ssh/
fi

if [ ! -e "/home/${USER}/ssh-keys/${LOCALNAME}" ]; then
  mkdir -p "/home/${USER}/ssh-keys/${LOCALNAME}"
fi

#variables
USER_KEY_DIR="/home/${USER}/ssh-keys/${LOCALNAME}"
SSH_ID_FILENAME="/home/${USER}/ssh-keys/${LOCALNAME}/id_${type}_${keyname}"
authorized_keys="/home/${USER}/.ssh/authorized_keys"

if [ -e $SSH_ID_FILENAME ]; then
  echo "Your Key ${SSH_ID_FILENAME} has already been created"
  echo "If you'd like to create a new key"
  echo "You Must Remove it"
  err_code=1
  read wait
else
  if [ ! -e $authorized_keys ]; then
    touch /home/$USER/.ssh/authorized_keys
  fi
fi

if [ ! $err_code ]; then 
  echo "create a new ssh key ${SSH_ID_FILENAME}"
  ssh-keygen -t ${keytype} -N "" -f $SSH_ID_FILENAME -C "${LOCALNAME}'s-LocalPC"
  cat "${SSH_ID_FILENAME}.pub" >> /home/$USER/.ssh/authorized_keys
  echo "Generated your ssh-key in '${SSH_ID_FILENAME}'"
fi
