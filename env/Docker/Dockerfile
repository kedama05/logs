FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu16.04
LABEL maintainer caffe-maint@googlegroups.com

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
        python-numpy \
        python-pip \
        python3-pip \
        python-setuptools \
        python-scipy \
        sudo \
        openssh-server && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN echo "export PATH='/usr/local/cuda/bin':$PATH" >> /etc/profile
RUN echo "export LD_LIBRARY_PATH='/usr/local/cuda/lib64':$LD_LIBRARY_PATH" >> /ect/profile
RUN source /etc/profile

WORKDIR ~/
RUN git clone https://github.com/kedama05/init.git && cd init && bash initEnv.sh \
    mv run_setup.sh ~/

ENV CAFFE_ROOT=/opt/caffe
WORKDIR $CAFFE_ROOT

# FIXME: use ARG instead of ENV once DockerHub supports this
# https://github.com/docker/hub-feedback/issues/460
ENV CLONE_TAG=1.0

RUN git clone -b ${CLONE_TAG} --depth 1 https://github.com/BVLC/caffe.git . && \
    pip install --upgrade pip && \
    cd python && for req in $(cat requirements.txt) pydot; do pip install $req; done && cd .. && \
    git clone https://github.com/NVIDIA/nccl.git && cd nccl && make -j install && cd .. && rm -rf nccl && \
    mkdir build && cd build && \
    cmake -DUSE_CUDNN=1 -DUSE_NCCL=1 .. && \
    make -j"$(nproc)"

ENV PYCAFFE_ROOT $CAFFE_ROOT/python
ENV PYTHONPATH $PYCAFFE_ROOT:$PYTHONPATH
ENV PATH $CAFFE_ROOT/build/tools:$PYCAFFE_ROOT:$PATH
RUN echo "$CAFFE_ROOT/build/lib" >> /etc/ld.so.conf.d/caffe.conf && ldconfig

RUN echo "CAFFE_ROOT='/opt/caffe'" >> /ect/profile
RUN echo "PYCAFFE_='$CAFFE_ROOT/python'" >> /ect/profile
RUN echo "PYTHONPATH='$PYCAFFE_ROOT:$PYTHONPATH'" >> /ect/profile
RUN echo "PATH='$CAFFE_ROOT/build/tools:$PYCAFFE_ROOT:$PATH'" >> /ect/profile

# check Env
RUN echo "nvidia" && nvidia-smi
RUN echo "cuda" && nvcc -V
RUN echo "cudnn" && cat /usr/include/cudnn.h | grep CUDNN_MAJOR -A 2
RUN echo "caffe" & caffe --version

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

