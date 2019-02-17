#!/bin/bash
WORK_DIR=${PWD}
echo "run no000-004"
cd scripts
bash no000_check.sh
bash no001_github.sh
bash no002_virtualenv.sh
bash no003_openpose.sh
bash no004_jqCommand.sh
cd $WORK_DIR
