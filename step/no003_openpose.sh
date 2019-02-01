#!/bin/bash
WORK_DIR=${PWD}

# clone openpose
cd ~/
git clone https://github.com/CMU-Perceptual-Computing-Lab/openpose
cd ~/openpose/ && git pull origin master
mkdir build && cd build

# mod caffe folder
sudo cp -a /opt/caffe/.build_release/src/caffe/proto /opt/caffe/include/caffe/proto

# cmake
cmake \
-DOpenCV_INCLUDE_DIRS=/opt/dev/opencv-3.3.0/include \
-DOpenCV_LIBS_DIR=/opt/dev/opencv-3.3.0/build/lib \
-DCaffe_INCLUDE_DIRS=/opt/caffe/include \
-DCaffe_LIBS=/opt/caffe/build/lib/libcaffe.so -DBUILD_CAFFE=OFF ..

# make
make -j`nproc`

cd ..
mkdir output
./build/examples/openpose/openpose.bin \
--video examples/media/video.avi \
--write_json output \
--display 0 \
--write_video output/video.avi

cd $WORKDIR
