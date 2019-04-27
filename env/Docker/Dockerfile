FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu16.04
LABEL maintainer caffe-maint@googlegroups.com

COPY init /root/

# apt-get
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        vim \
        git \
        wget \
        libatlas-base-dev \
        libboost-all-dev \
        libgflags-dev \
        libgoogle-glog-dev \
        libhdf5-serial-dev \
        libleveldb-dev \
        liblmdb-dev \
        libopencv-dev \
        libprotobuf-dev \
        libsnappy-dev \
        protobuf-compiler \
        python-dev \
        python3-dev \
        python-pip \
        python3-pip \
        python-setuptools \
        python3-setuptools \
        sudo \
        openssh-server && \
    rm -rf /var/lib/apt/lists/*

# SSH
RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN echo "export PATH='/usr/local/cuda/bin:$PATH'" >> /etc/profile
RUN echo "export LD_LIBRARY_PATH='/usr/local/cuda/lib64:$LD_LIBRARY_PATH'" >> /etc/profile
ENV VISIBLE now
ENV PATH /usr/local/cuda/bin:$PATH
ENV LD_LIBRARY_PATH /usr/local/cuda/lib64:$LD_LIBRARY_PATH

# set LC_ALL for pip
RUN echo "export LC_ALL=C" >> /etc/profile
ENV LC_ALL C
# pip update
RUN pip install --upgrade pip
RUN pip3 install --upgrade pip
# rename default pip file
RUN mv /usr/bin/pip /usr/bin/def_pip && \
    mv /usr/bin/pip3 /usr/bin/def_pip3
# copy pip file
RUN mv /root/pip /usr/bin/ && \
    mv /root/pip3 /usr/bin/
# pip install
RUN pip install numpy scipy
RUN pip3 install numpy scipy


# For OpenCV
ENV DEV_ROOT /opt/dev
WORKDIR $DEV_ROOT
# build OpenCV
RUN wget -O opencv-3.3.0.tar.gz https://github.com/opencv/opencv/archive/3.3.0.tar.gz && \
    tar zxvf opencv-3.3.0.tar.gz && rm opencv-3.3.0.tar.gz && cd opencv-3.3.0 && \
    mkdir build && cd build && \
    cmake -D BUILD_opencv_python2=OFF -D BUILD_opencv_python3=ON -D PYTHON_DEFAULT_EXECUTABLE=$(which python3.5) .. && \
    make -j"$(nproc)" && make install

# For caffe
ENV CAFFE_ROOT /opt/caffe
WORKDIR $CAFFE_ROOT

# FIXME: use ARG instead of ENV once DockerHub supports this
# https://github.com/docker/hub-feedback/issues/460
ENV CLONE_TAG=1.0

# check link
RUN echo "check link"
RUN ls /usr/lib/x86_64-linux-gnu/ | grep -E "libboost_python*|libpython*"

# symbolic link
RUN ln -s /usr/lib/x86_64-linux-gnu/libboost_python-py35.so /usr/lib/x86_64-linux-gnu/libboost_python3.so
#RUN ln -s /usr/lib/x86_64-linux-gnu/libpython3.5m.so.1.0 /usr/lib/x86_64-linux-gnu/libpython3.5m.so
RUN ls -al /usr/lib/x86_64-linux-gnu/ | grep -E "libboost_python*|libpython*"

# build caffe
RUN git clone -b ${CLONE_TAG} --depth 1 https://github.com/BVLC/caffe.git . && \
    cd python && for req in $(cat requirements.txt) pydot; do pip3 install $req; done && cd .. && \
    git clone https://github.com/NVIDIA/nccl.git && cd nccl && make -j install && cd .. && rm -rf nccl && \
    mv /root/Makefile.config $CAFFE_ROOT && \
    make -j"$(nproc)"

RUN make pycaffe
RUN echo "export PYTHONPATH='$CAFFE_ROOT/python:$PYTHONPATH'" >> /etc/profile

ENV PYCAFFE_ROOT $CAFFE_ROOT/python
ENV PYTHONPATH $PYCAFFE_ROOT:$PYTHONPATH
ENV PATH $CAFFE_ROOT/build/tools:$PYCAFFE_ROOT:$PATH
RUN echo "$CAFFE_ROOT/build/lib" >> /etc/ld.so.conf.d/caffe.conf && ldconfig

RUN echo "export CAFFE_ROOT=/opt/caffe" >> /etc/profile
RUN echo "export PYCAFFE_ROOT='$CAFFE_ROOT/python'" >> /etc/profile
RUN echo "export PYTHONPATH='$PYCAFFE_ROOT:$PYTHONPATH'" >> /etc/profile
RUN echo "export PATH='$CAFFE_ROOT/build/tools:$PYCAFFE_ROOT:$PATH'" >> /etc/profile
RUN pip3 install python-dateutil --upgrade

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
