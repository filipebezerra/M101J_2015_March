#!/usr/bin/env bash

echo "Updating System packages..."
sudo apt-get update -y > /dev/null 2>&1

echo "Installing System Tools..."
sudo apt-get install -y vim > /dev/null 2>&1

echo "Importing the public key used by the package management system..."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

echo "Creating a list file for MongoDB..."
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

echo "Reloading local package database..."
sudo apt-get update -y > /dev/null 2>&1

echo "Installing the MongoDB packages..."
sudo apt-get install -y mongodb-org > /dev/null 2>&1

echo "Starting MongoDB..."
sudo service mongod start