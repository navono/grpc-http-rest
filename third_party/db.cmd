mkdir todoDB
REM echo %cd%

docker stop todo-mysql
docker rm todo-mysql
docker run --name todo-mysql -p 3306:3306 -v %cd%/todoDB:/var/lib/mysql -e MYSQL_ROOT_PASSWORD="123456" -d mysql