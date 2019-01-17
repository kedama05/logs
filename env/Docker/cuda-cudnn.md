Docker
====
#cuda8-cudnn5
----
## make image
    $ sudo docker build -t ubuntu/gpu:cuda8-cudnn5 /home/dl-box/Desktop/nvidiaSshDockerFile/
    $ sudo docker images
## check image
    $ sudo docker run --runtime=nvidia --rm ubuntu16/gpu:cuda8-cudnn5 nvidia-smi
    $ sudo docker run --runtime=nvidia --rm ubuntu16/gpu:cuda8-cudnn5 nvcc --version
## make container
    $ sudo docker run --runtime=nvidia --name "name" -d -p port_num:22 ubuntu16/gpu:cuda8-cudnn5
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
    
    RUN echo "export PATH='/usr/local/cuda/bin':$PATH" >> ~/.bash_profile
    RUN echo "export LD_LIBRARY_PATH='/usr/local/cuda/lib64':$LD_LIBRARY_PATH" >> ~/.bash_profile
    
    EXPOSE 22
    CMD ["/usr/sbin/sshd", "-D"]
----
# nvidia-docker option
    dl-box@DL-Box:~$ nvidia-docker -h
    Flag shorthand -h has been deprecated, please use --help
    
    Usage:	docker [OPTIONS] COMMAND
    
    A self-sufficient runtime for containers
    
    Options:
          --config string      Location of client config files (default
                               "/home/dl-box/.docker")
      -D, --debug              Enable debug mode
      -H, --host list          Daemon socket(s) to connect to
      -l, --log-level string   Set the logging level
                               ("debug"|"info"|"warn"|"error"|"fatal")
                               (default "info")
          --tls                Use TLS; implied by --tlsverify
          --tlscacert string   Trust certs signed only by this CA (default
                               "/home/dl-box/.docker/ca.pem")
          --tlscert string     Path to TLS certificate file (default
                               "/home/dl-box/.docker/cert.pem")
          --tlskey string      Path to TLS key file (default
                               "/home/dl-box/.docker/key.pem")
          --tlsverify          Use TLS and verify the remote
      -v, --version            Print version information and quit
    
    Management Commands:
      builder     Manage builds
      config      Manage Docker configs
      container   Manage containers
      engine      Manage the docker engine
      image       Manage images
      network     Manage networks
      node        Manage Swarm nodes
      plugin      Manage plugins
      secret      Manage Docker secrets
      service     Manage services
      stack       Manage Docker stacks
      swarm       Manage Swarm
      system      Manage Docker
      trust       Manage trust on Docker images
      volume      Manage volumes
    
    Commands:
      attach      Attach local standard input, output, and error streams to a running container
      build       Build an image from a Dockerfile
      commit      Create a new image from a container's changes
      cp          Copy files/folders between a container and the local filesystem
      create      Create a new container
      deploy      Deploy a new stack or update an existing stack
      diff        Inspect changes to files or directories on a container's filesystem
      events      Get real time events from the server
      exec        Run a command in a running container
      export      Export a container's filesystem as a tar archive
      history     Show the history of an image
      images      List images
      import      Import the contents from a tarball to create a filesystem image
      info        Display system-wide information
      inspect     Return low-level information on Docker objects
      kill        Kill one or more running containers
      load        Load an image from a tar archive or STDIN
      login       Log in to a Docker registry
      logout      Log out from a Docker registry
      logs        Fetch the logs of a container
      pause       Pause all processes within one or more containers
      port        List port mappings or a specific mapping for the container
      ps          List containers
      pull        Pull an image or a repository from a registry
      push        Push an image or a repository to a registry
      rename      Rename a container
      restart     Restart one or more containers
      rm          Remove one or more containers
      rmi         Remove one or more images
      run         Run a command in a new container
      save        Save one or more images to a tar archive (streamed to STDOUT by default)
      search      Search the Docker Hub for images
      start       Start one or more stopped containers
      stats       Display a live stream of container(s) resource usage statistics
      stop        Stop one or more running containers
      tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
      top         Display the running processes of a container
      unpause     Unpause all processes within one or more containers
      update      Update configuration of one or more containers
      version     Show the Docker version information
      wait        Block until one or more containers stop, then print their exit codes
    
    Run 'docker COMMAND --help' for more information on a command.
