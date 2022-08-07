#/bin/bash

# Simple helper script to import new data

cd /tiler/data
rm -f /tiler/data/sweden-latest.osm.pbf
wget https://download.geofabrik.de/europe/sweden-latest.osm.pbf \
&& sudo -u _renderd osm2pgsql -d gis --create --slim  -G --hstore --tag-transform-script /tiler/git/openstreetmap-carto/openstreetmap-carto.lua -C 2500 --number-processes 1 -S /tiler/git/openstreetmap-carto/openstreetmap-carto.style /tiler/data/sweden-latest.osm.pbf
/tiler/scripts/restart.sh