work in 19/01/08
====

# case01
## purpose
    To get nvidia and cuda.
## approach
    *step01
        check nvidia or cuda.
        `$ dpkg -l | grep nvidia`
        `$ dpkg -l | grep cuda`
        if have nvidia
        `$ sudo apt-get --purge remove nvidia-*`
    *step02
        check GUP.
        `lspci | grep -i nvidia`
    *step03 <if have nvidia>
        stop Xserver
        `$ sudo service lightdm stop`
        `$ pkill Xorg`
    *step04
        add ppa repository
        > PPA : Personal package archive
        > PPA means "informal repository."
        > [ref](https://allabout.co.jp/gm/gc/438675/)
        `$ sudo add-apt-repository ppa:graphics-drivers/ppa`
        `$ sudo apt update`
    *step05
        `$ sudo apt-get install ubuntu-drivers-common`
        `$ sudo ubuntu-drivers devices`
        `$ sudo apt install nvidia-384`
        `$ sudo nvidia-smi`
        reboot
    [Ref](http://swytel.hatenablog.com/entry/2018/05/08/174943)
----

# case02
## purpose
    To add PPA repository.
    `$ sudo add-apt-repository ppa:graphics-drivers/ppa`
## problem
    Error exist
    "add-apt-repository: command not found"
## approach
    Get add-apt-repository
    `$ sudo apt-get install apt-file`
    `$ sudo apt-file update`
    `$ sudo apt-file search add-apt-repository`
    `$ sudo apt-get install software-properties-common`
    apt-file : Utility for finding the apt package

----
