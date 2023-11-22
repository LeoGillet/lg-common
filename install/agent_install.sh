#!/bin/bash
cd /tmp/dep-installers/downloads

wget -O agent.zip "https://dt4ei3l3hxs7z.cloudfront.net/?elqTrackId=30b3c5b8c3bd44f7b3a01b66ab2a30a5&elqaid=3928&elqat=2"
unzip agent.zip
mv agent /opt/
ln -s /opt/agent/agent.sh /usr/bin/agent.sh