#!/bin/bash

# Check if the script is running as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Set the Ubuntu release name and version you want to add
release="focal"
version="20.04"

# Create a new source list file for the Ubuntu repository
echo "deb http://archive.ubuntu.com/ubuntu/ ${release} main restricted universe multiverse" > /etc/apt/sources.list.d/ubuntu-${release}.list
echo "deb http://archive.ubuntu.com/ubuntu/ ${release}-updates main restricted universe multiverse" >> /etc/apt/sources.list.d/ubuntu-${release}.list
echo "deb http://archive.ubuntu.com/ubuntu/ ${release}-backports main restricted universe multiverse" >> /etc/apt/sources.list.d/ubuntu-${release}.list
echo "deb http://security.ubuntu.com/ubuntu/ ${release}-security main restricted universe multiverse" >> /etc/apt/sources.list.d/ubuntu-${release}.list

# Import the Ubuntu repository keyring
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 40976EAF437D05B5
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 3B4FE6ACC0B21F32

# Update the package cache
apt update
This script adds an Ubuntu source list for the specified release and version to the /etc/apt/sources.list.d directory, which is the recommended location for adding custom sources.

The script also imports the Ubuntu repository keyring using apt-key, which is required for the package manager to verify the integrity of the packages downloaded from the repository.

Finally, the script updates the package cache using apt update, which makes the new Ubuntu packages available for installation alongside the existing Debian packages.




