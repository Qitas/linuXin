#!/bin/bash

function nginx_init()
{
    yum install -y nginx
    systemctl enable nginx.service
    systemctl start nginx.service
}

nginx_init

exit 0
