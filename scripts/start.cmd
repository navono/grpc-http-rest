mkdir todoDB
REM echo %cd%

docker network create --driver bridge todo-net
docker run --name todo-mysql -p 3306:3306 --network todo-net -v %cd%/todoDB:/var/lib/mysql -e MYSQL_ROOT_PASSWORD="123456" -d mysql
docker run --name todo-service -d --network todo-net -p 8080:8080 -p 9090:9090 tech-research/todo-server -grpc-port=9090 -http-port=8080 -db-host=todo-mysql:3306 -db-user=root -db-password=123456 -db-schema=todo -log-level=1 -log-time-format=2006-01-02T15:04:05.999999999Z07:00
