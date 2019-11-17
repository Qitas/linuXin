#!/bin/bash

shellPath=`pwd`

function clone_repo()
{
    	if [ -f $shellPath/src/kicad.tar.gz ]; then
		cd $shellPath/src
		mkdir kicad
		tar -xzvf kicad.tar.gz  -C kicad --strip-components 1 
    	fi
    	if [ ! -d $shellPath/src/kicad ]; then
        	cd $shellPath/src
		git clone --depth=1 -b master https://git.launchpad.net/kicad 
	else
	    	cd $shellPath/src/kicad
		git pull
	fi
	echo "git clone kicad repo\n${Line}"
}

# 编译安装
if [ -d  $shellPath/src ]; then
	cd $shellPath/src
	count=`ls $*|wc -w`
	if [ "$count" > "0" ]; then
		clone_repo
	fi
fi

if [ ! -d  $shellPath/src/kicad ]; then
	# remove old version
	sudo apt-get remove -y kicad kicad-footprints kicad-libraries
	sudo apt-get remove -y kicad-symbols kicad-templates  kicad-packages3d
	sudo apt-get remove -y kicad-doc-* kicad-locale-*
	# add repo
	sudo add-apt-repository --yes ppa:js-reynaud/kicad-5.1
	sudo apt update

	#sudo apt install kicad
	sudo apt install -y --install-suggests kicad	
fi
