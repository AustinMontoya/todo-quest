#/bin/bash

set -e
docker_host_ip=$(docker-machine ip $DOCKER_MACHINE_NAME)

function create_todo {
  curl -s -X POST \
    -H "Content-Type: application/json" \
    -d "{ \"title\": \"$1\", \"playerId\": \"$player_id\" }" \
    http://$docker_host_ip:${TODOS_APP_HOST_PORT:-3000}/todos \
    | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["url"]' \
    | awk '{print "Todo Url: "$1}'
}

function create_player {
  curl -s -X POST \
    -H "Content-Type: application/json" \
    -d '' \
    http://$docker_host_ip:${PLAYERS_APP_HOST_PORT:-4000}/players \
    | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["id"]'
}

echo "\nInserting new player..."
player_id=$(create_player)

echo "PlayerId: $player_id"
echo "\nInserting new todos"
create_todo "Finish TodoQuest"
create_todo "Make lots of friends"
create_todo "Eat fried chicken"
