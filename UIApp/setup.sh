version=`date "+%H-%M-%S_%d-%m-%y"`
echo $version
docker container prune -f
docker image prune -f
docker volume prune -f
docker network prune -f
docker build -t qa-ui .
docker run -p 80:8080 qa-ui