#!/usr/bin/env bash
docker run "$@" --rm -it --env-file ./.env fkrauthan/sheepit
