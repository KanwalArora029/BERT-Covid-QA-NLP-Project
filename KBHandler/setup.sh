## get elasticsearch Image
docker pull elasticsearch:7.14.2

## run the container
docker run -d -p 9200:9200 -e "discovery.type=single-node" elasticsearch:7.14.2