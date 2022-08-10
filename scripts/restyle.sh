#!/bin/bash

# Simple helper script to restule the map and restart all services

cd /tiler/git/offroadmap-carto

carto project.mml > /tiler/git/offroadmap-carto/mapnik.xml

/tiler/scripts/restart.sh
