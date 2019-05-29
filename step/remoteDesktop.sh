#!/bin/bash
WORK_DIR=${PWD}

echo "> Stop remote-desktop."
sudo systemctl stop chrome-remote-desktop.service

echo "> Check DISPLAY number."
echo $DISPLAY
sudo mv /opt/google/chrome-remote-desktop/chrome-remote-desktop /opt/google/chrome-remote-desktop/chrome-remote-desktop.org
sudo cp ./.chrome-remote-desktop /opt/google/chrome-remote-desktop/chrome-remote-desktop

echo "> Start remote-desktop."
sudo systemctl restart chrome-remote-desktop.service

cd $WORK_DIR
