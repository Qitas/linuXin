#!/bin/bash

function docker_install()
{
	sudo yum remove docker \
			docker-client \
			docker-client-latest \
			docker-common \
			docker-latest \
			docker-latest-logrotate \
			docker-logrotate \
			docker-engine
	sudo yum install -y yum-utils \
			device-mapper-persistent-data \
			lvm2
	sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
	sudo yum makecache fast
	sudo yum -y install docker-ce
} 
function docker_config()
{
	systemctl enable docker
	echo "DOCKER_OPTS=\"--registry-mirror=https://docker.mirrors.ustc.edu.cn\"" >> /etc/default/docker
	systemctl start docker
}

docker_install
docker_config

exit 0
