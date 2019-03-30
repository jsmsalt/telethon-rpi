#!/bin/sh

docker login && \
docker build . -t telethon-rpi --no-cache && \
docker tag telethon-rpi jsmsalt/telethon-rpi:latest && \
docker push jsmsalt/telethon-rpi:latest