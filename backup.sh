echo "Enter the container to take backup"
echo "=================================="
docker ps -a
echo " Enter the container name"
read var1
echo "Image name to save"
read var2
docker commit -p  $var1  $var2
docker images
docker save -o $var2.tar $var2
 
