#!/bin/bash

cd /tmp/dep-installers/downloads
git clone https://github.com/xtensor-stack/xtl.git
cd xtl; mkdir build; cd build;
cmake -DCMAKE_INSTALL_PREFIX=/opt/xtl ..; make install