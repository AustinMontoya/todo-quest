TODOS_SERVICE_IP=${TODOS_SERVICE_IP:-$(docker-machine ip $DOCKER_MACHINE_NAME)} \
docker-compose up
