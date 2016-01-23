#!/bin/bash

echo "					Welcome to installation of wordpress container"
echo "					==============================================="
echo "Make user DOcker service is sarting "
echo "Press YES  to continue"
read -n 3 c
echo " "
echo "Wordpress is having MySQL database prerequisites"
echo "    "
echo "Images in the Host"
echo "========================================================================="
docker images
echo "========================================================================="
echo "Containers in the HOST"
docker ps -a
echo "========================================================================="
echo " "
echo "Please give MysqlDB container name"
read DBcontainer
#echo $DBcontainer
echo "Enter the MySQL root user password"
read DBPassword
echo "MySQL container ID"
echo "=================="
docker run --name $DBcontainer -e MYSQL_ROOT_PASSWORD=$DBPassword -d mysql:5.7
echo "=================="
docker ps -a
echo "Please give Wordpress container name"
read wordpresscontainer
docker run --name $wordpresscontainer --link $DBcontainer:mysql -d wordpress
docker ps -a
echo "IP address of the new container"
echo  "======================================================================="
docker inspect $wordpresscontainer | grep  "IPAddress"
echo " To access the container use http://ipaddress:80 as url in browser "
