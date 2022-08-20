#/bin/bash

# Simple helper script to import/update osm data

# Set working dir
cd /tiler/data

# Remove old downloads
rm -f /tiler/data/*.osm.pbf

# Get data
wget https://download.geofabrik.de/europe/sweden-latest.osm.pbf
wget https://download.geofabrik.de/europe/norway-latest.osm.pbf
#wget https://download.geofabrik.de/europe/finland-latest.osm.pbf

# Mege data
#osmosis --read-pbf sweden-latest.osm.pbf --read-pbf norway-latest.osm.pbf --read-pbf finland-latest.osm.pbf --merge --merge  --write-pbf merged.osm.pbf
osmosis --read-pbf sweden-latest.osm.pbf --read-pbf norway-latest.osm.pbf --merge  --write-pbf merged.osm.pbf

# Remove intermediate downloads
rm -f /tiler/data/*-latest.osm.pbf

# Create/Recreate database
sudo -u _renderd osm2pgsql -d gis --create --slim  -G --hstore --tag-transform-script /tiler/git/offroadmap-carto/offroadmap-carto.lua -C 2500 --number-processes 2 -S /tiler/git/offroadmap-carto/offroadmap-carto.style /tiler/data/merged.osm.pbf

# Create/Recreate indexes
cd /tiler/git/offroadmap-carto
sudo -u _renderd psql -d gis -f indexes.sql

# Restart server
/tiler/scripts/restart.sh
