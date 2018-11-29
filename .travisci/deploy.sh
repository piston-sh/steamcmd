#!/bin/bash

# ubuntu-xenial
docker push sourceforts/steamcmd:ubuntu-xenial-$TRAVIS_BUILD_NUMBER
docker push sourceforts/steamcmd:ubuntu-xenial
docker push sourceforts/steamcmd:ubuntu
docker push sourceforts/steamcmd:latest
