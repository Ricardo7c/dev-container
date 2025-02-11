#!/bin/bash

#Cria o container
docker run -d -it \
  --name dev-container \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ~/Dev:/home/Dev \
  dev-container
