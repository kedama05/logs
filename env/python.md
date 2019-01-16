Python
====
# pip
    $ sudo apt install python-pip python3-pip
    $ which pip
    $ which pip3
## problem01
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
    $ sudo vim ~/.bash_profile
    export LC_ALL="C"
## .bashrc vs .bash_profile
### .bashrc
    Run only at login
### .bash_profile
    Run each time to start bash.
## problem02
    $ pip install --upgrade pip
    $ pip list

    miyo@bd393291fdfc:~/python/tf-gpu$ pip list
    Traceback (most recent call last):
    File "/usr/bin/pip", line 9, in <module>
        from pip import main
    ImportError: cannot import name main
## approach
    $ sudo vim /usr/bin/pip
    
    from pip import __main__
    if __name__ == '__main__':
        sys.exit(__main__._main())
----
# virtualenv
## install
    $ pip install virtualenv
## use
    $ virtualenv -p <python_version> <env_name>
    $ . <env_name>/bin/activate
    $ deactivate
====
# Python Library

## tensorflow and keras
    $ pip install tensorflow-gpu==1.2.0
    $ pip install keras
    [Correspondence table](https://www.tensorflow.org/install/source#common_installation_problems)

## scipy
    scipy is a Python library for performing advanced scientific calculations.

    Using scipy needs numpy

## matplotlib
    Matplotlib is a Python drawing library.

## pandas
    pandas is a Python data analysis library.
    *Display data statistics
    *Graphing
    *Data analysis
## sympy
    SymPy is a Python algebra calculation library.
    *Factorization
    *equation
    *Calculus

## nose
    nose is a unit test library.
    Easy to use unit tests easily.

## Tkinter
    Tkinter is a module for using Tk from Python.
    Tk is a toolkit for creating graphical user interfaces.

## yaml
    A library for handling YAML in Python.
    YAML is a format for expressing structured data.



