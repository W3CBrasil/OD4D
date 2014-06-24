#!/usr/bin/env bash

PROJECT_FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo apt-get remove -y openjdk-6-jre
sudo apt-get install -y openjdk-7-jre
