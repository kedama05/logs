Docker
====
#cuda8-cudnn5
----
## make image
    $ sudo docker build -t ubuntu16/caffe:cuda8-cudnn5-opencv3.3.0 /home/dl-box/Desktop/caffeDockerFile/
    $ sudo docker images
## check image
    $ sudo docker run --runtime=nvidia --rm ubuntu16/caffe:cuda8-cudnn5-opencv3.3.0 nvidia-smi
    $ sudo docker run --runtime=nvidia --rm ubuntu16/caffe:cuda8-cudnn5-opencv3.3.0 nvcc --version
## make container
    $ sudo docker run --runtime=nvidia --name "name" -d -p port_num:22 ubuntu16/caffe:cuda8-cudnn5-opencv3.3.0
    $ sudo docker ps -a
## connect container
    $ bash run_setup.sh
    $ exit

## X-server container [ref](https://qiita.com/gitcell/items/8b1f154edc26def7ecce) 
    $ docker run -dti --name miyo -u miyos --net host -e DISPLAY=$DISPLAY -v $HOME/.Xauthority:/home/miyos/.Xauthority ubuntu16/caffe:openpose-190605 /bin/bash  
