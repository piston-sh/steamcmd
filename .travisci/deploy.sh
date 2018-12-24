#!/bin/bash

# ubuntu-xenial
docker push pistonsh/steamcmd:ubuntu-xenial-$TRAVIS_BUILD_NUMBER
docker push pistonsh/steamcmd:ubuntu-xenial
docker push pistonsh/steamcmd:ubuntu
docker push pistonsh/steamcmd:latest
