
# TensorBoard on Server.  
### on server  
    $ tensorboard --logdir=/path/to/log/ --port (port S)  

### on local  
    $ ssh -L (port L):localhost:(port S) (user)@(server IP address)  

acess to "http://localhost:(port L)"

## expample  
    tensorboard --logdir=/path/to/log/ --port 8080  
    ssh -L 6006:localhost:8080 (user)@(server IP address)  

acess to "http://localhost:6006"  
