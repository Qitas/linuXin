#!/bin/bash
shellPath=`pwd`

function get_src()
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
	echo "download kicad src \n${Line}"
}


if [ -d  $shellPath/src ]; then
	cd $shellPath/src
	count=`ls $*|wc -w`
	if [ "$count" > "0" ]; then
		get_src
	fi
fi

if [ ! -d  $shellPath/src/kicad ]; then
	# kicad pcb tools
	sudo apt-get remove -y kicad kicad-footprints kicad-libraries
	sudo apt-get remove -y kicad-symbols kicad-templates  kicad-packages3d
	sudo apt-get remove -y kicad-doc-* kicad-locale-*

	sudo add-apt-repository --yes ppa:js-reynaud/kicad-5.1
	sudo apt update
	#sudo apt install kicad
	sudo apt install -y --install-suggests kicad	
fi
