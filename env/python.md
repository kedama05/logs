Python
====
# pip
    $ sudo apt install python-pip python3-pip
    $ which pip
    $ which pip3
## problem
    $ pip list

    miyo@bd393291fdfc:~$ pip list
    Traceback (most recent call last):
      File "/usr/bin/pip", line 11, in <module>
        sys.exit(main())
      File "/usr/lib/python2.7/dist-packages/pip/__init__.py", line 215, in main
        locale.setlocale(locale.LC_ALL, '')
      File "/usr/lib/python2.7/locale.py", line 581, in setlocale
        return _setlocale(category, locale)
    locale.Error: unsupported locale setting
## approach
    $ echo "export LC_ALL=C" >> ~/.bash_profile
## .bashrc vs .bash_profile
### .bashrc
    Run only at login
### .bash_profile
    Run each time to start bash.
# virtualenv
