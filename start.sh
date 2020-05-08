#!/bin/sh

docker network create jamdev || true

./certs.sh regen

docker-compose up -d
