docker stop todo-service
docker stop todo-mysql

docker rm todo-service
docker rm todo-mysql

docker network rm todo-net