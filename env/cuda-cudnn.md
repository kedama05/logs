Cuda8.0-Cudnn5
====
## make image
    $ sudo docker build -t cuda8-cudnn5:1.0 /home/dl-box/Desktop/nvidiaSshDockerFile/
    $ sudo docker images
## check image
    $ sudo docker run --runtime=nvidia --rm cuda8-cudnn5:1.0 nvidia-smi
    $ sudo docker run --runtime=nvidia --rm cuda8-cudnn5:1.0 nvcc --version
## make container
    $ sudo docker run --runtime=nvidia --name "container_name" -d -p 33000:22 cuda8-cudnn5:1.0
    $ sudo docker ps -a
    $ cp /root/.bash_profile /home/miyo/
## connect container
    $ nvcc -V

## Docker File
    FROM nvidia/cuda:8.0-devel-ubuntu16.04
    LABEL maintainer "NVIDIA CORPORATION <cudatools@nvidia.com>"
    
    RUN echo "deb https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list
    
    ENV CUDNN_VERSION 5.1.10
    LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"
    
    RUN apt-get update && apt-get install -y --no-install-recommends \
                libcudnn5=$CUDNN_VERSION-1+cuda8.0 \
                            libcudnn5-dev=$CUDNN_VERSION-1+cuda8.0 && \
                                rm -rf /var/lib/apt/lists/*
    
    RUN apt-get update && apt-get install -y openssh-server
    RUN apt-get install sudo -y
    RUN mkdir /var/run/sshd
    RUN echo 'root:password' | chpasswd
    RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
    
    # SSH login fix. Otherwise user is kicked off after login
    RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
    
    ENV NOTVISIBLE "in users profile"
    RUN echo "export VISIBLE=now" >> /etc/profile
    
    RUN apt-get install vim -y
    
    RUN echo "export PATH='$PATH:/usr/local/cuda/bin'" >> ~/.bash_profile
    RUN echo "export LD_LIBRARY_PATH='$LD_LIBRARY_PATH:/usr/local/cuda/lib64'" >> ~/.bash_profile
    
    EXPOSE 22
    CMD ["/usr/sbin/sshd", "-D"]
