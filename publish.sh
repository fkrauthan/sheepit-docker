#!/usr/bin/env bash
version=latest

if [ ! -z "$1" ]; then
    version="$1"
    docker tag fkrauthan/sheepit "fkrauthan/sheepit:$version"
    docker push "fkrauthan/sheepit:$version"
fi

docker push fkrauthan/sheepit
