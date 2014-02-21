#!/bin/bash

echo Installing Vendor Applications to ./vendor
rm -rf vendor && \
  git clone -q --recursive --depth=1 git@github.com:radiodan/radiodan.js.git vendor/radiodan_server && \
  git clone -q --recursive --depth=1 git@github.com:radiodan/cold_start.git vendor/cold_start

echo Setting up vagrant box for first use
vagrant up && vagrant halt && \
  echo Enabling Audio Controller && \
  VBoxManage modifyvm vagrant_radiodan --audio coreaudio --audiocontroller ac97 && \
  vagrant up
