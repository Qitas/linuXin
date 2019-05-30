TOP=$(shell pwd)
INC_DIR = -I $(TOP)/include -I /usr/include

#KERNEL	:= /lib/modules/`uname -r`/build  #for mint/ubuntu
KERNEL	:= /lib/modules/`uname -r`/source #for redhat

all:
	sudo make $(INC_DIR) -C $(KERNEL) M=`pwd` modules 
rm:
	sudo rmmod qitas
clean:
	sudo make -C $(KERNEL) M=`pwd` clean
