#!/bin/bash
nvidia-smi
nvcc -V
cat /usr/include/cudnn.h | grep CUDNN_MAJOR -A 2
caffe --version
