This repository contains all the files used to taught myself MIPS-Assembly.  
There is also a crude makefile in there :/

## Prerequisites
If you are working on a platform other than MIPS (in this case x86), you have to install the following packages:

    sudo apt install build-essential gcc-mips-linux-gnu qemu-user

In all cases, the package *build-essential* is required.

## Building
To build this repository, first make sure that gcc for the MIPS architecture  is installed (e.g. *gcc-mips-linux-gnu*), then run the command:

    make

This will create a directory called *out* with the executable *hello* inside.

## Run the Program
To run, for example, the executable file on the x86 platform, use the following command:

    qemu-mips out/hello

