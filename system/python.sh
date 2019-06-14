#!/bin/bash

export shellPath=`pwd`
export WorkPath=$shellPath/..

function get_python()
{
	if [ ! -d  $shellPath/download ]; then
        cd $shellPath/
		sudo mkdir download
    fi
    if [ ! -f $shellPath/download/python.tar.xz ]; then
        cd $shellPath/download
		wget -O python.tar.xz https://www.python.org/ftp/python/3.8.0/Python-3.8.0b1.tar.xz
    fi
	if [ ! -d  $shellPath/download/python ]; then
        cd $shellPath/download
		sudo mkdir python
		sudo tar -xvf python.tar.xz  -C python --strip-components 1 
    fi
	echo -e "finish getting python\n${Line}"
}



function config_python()
{
	sudo yum install -y libffi-devel
	if [ ! -d  $shellPath/download/python ]; then
        cd $shellPath/download/python
		make configure
		./configure
		make && make install
    fi
	echo -e "finish python config\n${Line}"
}


get_python
config_python


exit 0
