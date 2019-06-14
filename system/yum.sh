#!/bin/bash

export shellPath=`pwd`
export WorkPath=$shellPath/..

function repo_config()
{
	sudo mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
	sudo wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
	sudo yum clean all
	sudo yum makecache
	sudo yum -y update
} 

function conn_config()
{
	sudo yum install epel-release git -y
	sudo yum install gcc kernel-devel -y
	sudo yum install openssl openssl-devel -y  
} 


function src_replace()
{
	:  '
	for file in `ls *.repo`
	do
		mv $file $(echo $file | sed 's/AAA//g')
	done
	'

	if [ ! -f /etc/yum.repos.d/google-chrome.repo ]; then
		sudo cp ./src/google-chrome.repo /etc/yum.repos.d/
  	fi
	if [ ! -f /etc/yum.repos.d/gitlab-ce.repo ]; then
		sudo cp ./src/gitlab-ce.repo /etc/yum.repos.d/
  	fi	
} 

repo_config
conn_config
src_replace


exit 0
