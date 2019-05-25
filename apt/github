#!/bin/bash

export shellPath=`pwd`
export WorkPath=$shellPath/..

function get_git()
{
	if [ ! -d  $shellPath/download ]; then
        cd $shellPath/
		sudo mkdir download
    fi
    if [ ! -f $shellPath/download/git.tar.gz ]; then
        cd $shellPath/download
		wget -O git.tar.gz https://github.com/git/git/archive/v2.22.0-rc1.tar.gz
    fi
	if [ ! -d  $shellPath/download/git ]; then
        cd $shellPath/download
		sudo mkdir git
		sudo tar -xzvf git.tar.gz  -C git --strip-components 1 
    fi
	echo "finish download git src \n${Line}"
}

function config_git()
{
	sudo yum -y install libicu-devel patch gcc-c++ readline-devel zlib-devel libffi-devel openssl-devel 
	sudo yum -y install make autoconf automake libtool bison libxml2-devel libxslt-devel libyaml-devel 
	sudo yum -y install cpio expat-devel gettext-devel curl-devel perl-ExtUtils-CBuilder cmake pcre-devel
	if [ ! -d  $shellPath/download/git ]; then
        cd $shellPath/download/git
		make configure
		./configure --prefix=/home/git 
		make && make install
		sudo echo 'export PATH=/home/git/bin:$PATH' >> /etc/profile
		sudo export PATH="/home/git/bin:$PATH" 
		source /etc/profile
    fi
	echo "finish download git src \n${Line}"
}

#get_git
#config_git


echo "finish git config\n${Line}"

exit 0
