# offroadmap.org

Offroadmap.org is an effort to make a open topographic map, optimized for mountainbiking, enduro, snowmobile, hiking or horseback riding. This repository contains basic setup instructions and various helper scripts used to run the site. 

Feel fre to contribute in any way you like!

## Installation

Instructions is based on installation on a fresh installation of Ubuntu 22.04

### Create non root user using root account

```bash
adduser nonrootusername
```

Add non root user to sudo group

```bash
usermod -aG sudo nonrootusername
```

### Login as non root user

#### Update the system

```bash
sudo apt update
sudo apt upgrade
```

#### Enable swap

Swap is required to run certain commands if the server does not have enough RAM. Follow instructions at

(https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-22-04)

#### Prepare file structure and permissions

All files and configuration are placed in /tiler, and all files should be accessible by the group tiler.

```bash
sudo mkdir /tiler
sudo groupadd tiler
sudo usermod -aG tiler nonrootusername
sudo chgrp -R tiler /tiler
sudo chmod g+rwx /tiler
```

Check out this repository in /tiler, to get the scripts

#### Install mapnik, pgsql and mod_tile

Follow instructions at

(https://switch2osm.org/serving-tiles/manually-building-a-tile-server-ubuntu-22-04-lts/)

Make sure to put data in /tiler/data, cache in /tiler/cache, openstreetmap-carto in git/openstreetmap-carto etc, as the scripts assume these paths

Caches location is changed in `/etc/apache2/conf-enabled/renderd.conf` and `/etc/renderd.conf`

#### Add SSL certificates

... by following this guide

(https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-ubuntu-22-04)