version=`date "+%H-%M-%S_%d-%m-%y"`
echo $version
docker build -t qa-api .
docker tag qa-api us.gcr.io/annular-mercury-318319/qa-api:$version

docker container prune -f
docker image prune -f
docker volume prune -f
docker network prune -f

docker push us.gcr.io/annular-mercury-318319/qa-api:$version

##docker run -p 85:8080 qa-api -e ELASTIC_SEARCH_HOST='host.docker.internal' -e ELASTIC_SEARCH_PORT=9200
docker run -p 85:8080 -e es_host='0.0.0.0' -e es_port=9200 qa-api