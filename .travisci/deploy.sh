#!/bin/bash

# ubuntu-trusty
docker push sourceforts/steamcmd:ubuntu-trusty-$TRAVIS_BUILD_NUMBER
docker push sourceforts/steamcmd:ubuntu-trusty
docker push sourceforts/steamcmd:ubuntu
docker push sourceforts/steamcmd:latest

# ubuntu-xenial
docker push sourceforts/steamcmd:ubuntu-xenial-$TRAVIS_BUILD_NUMBER
docker push sourceforts/steamcmd:ubuntu-xenial

# debian-stretch
docker push sourceforts/steamcmd:debian-stretch-$TRAVIS_BUILD_NUMBER
docker push sourceforts/steamcmd:debian-stretch
docker push sourceforts/steamcmd:debian
