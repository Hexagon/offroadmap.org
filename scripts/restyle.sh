#!/bin/bash

# Simple helper script to restule the map and restart all services

cd /tiler/git/openstreetmap-carto

carto project.mml > mapnik.xml

/tiler/scripts/restart.sh