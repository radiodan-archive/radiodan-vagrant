#!/bin/bash

rm -rf vendor && \
git clone -q --recursive --depth=1 git@github.com:radiodan/radiodan.js.git vendor/radiodan_server && \
git clone -q --recursive --depth=1 git@github.com:radiodan/cold_start.git vendor/cold_start
