docker_host_ip=$(docker-machine ip $DOCKER_MACHINE_NAME)
include_data=noway

while [[ $# > 0 ]]
do
key="$1"

case $key in
    -d|--include-data)
    include_data=definitely
    ;;
esac
shift
done

echo "Creating todos database..."
curl -X PUT http://$docker_host_ip:${TODOS_DB_HOST_PORT:-6984}/todos

echo "\nCreating players database..."
curl -X PUT http://$docker_host_ip:${PLAYERS_DB_HOST_PORT:-7984}/players

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ $include_data = "definitely" ] ; then
  . $DIR/insert-sample-data.sh
fi
