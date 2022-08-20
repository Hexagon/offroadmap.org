#!/bin/bash

# Simple helper script to clear tile cache while developing map style

#sudo rm -rf /tiler/cache/s2o/11*
sudo rm -rf /tiler/cache/s2o/12*
sudo rm -rf /tiler/cache/s2o/13*
sudo rm -rf /tiler/cache/s2o/14*
sudo rm -rf /tiler/cache/s2o/15*
sudo rm -rf /tiler/cache/s2o/16*
sudo rm -rf /tiler/cache/s2o/17*

/tiler/scripts/restart.sh
