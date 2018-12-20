# dev

- 下载 [protobuf](https://github.com/protocolbuffers/protobuf/releases) 编译工具，将 `bin` 加入到环境变量
- 下载安装 `golang` 版本的插件
  > go get -u github.com/golang/protobuf/protoc-gen-go
- 编译
  > protoc --proto_path=api/proto/v1 --proto_path=third_party --go_out=plugins=grpc:pkg/api/v1 todo-service.proto
- 数据库依赖于运行在 `Docker` 中的 `MySQL`，启动 `MySQL` 容器：
  > ./third_party/db.cmd

  如果数据库客户端（navicat）链接不上：
  > docker exec -it todo-mysql bash
  >
  > mysql -u root -p
  > ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';
  >
  > ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '123456';
  >
  > FLUSH PRIVILEGES;

# 测试
编译时可能需要科学上网。

## 服务器端

编译：
> cd cmd/server
>
> go build .

运行：
> .\server.exe -grpc-port=9090 -db-host=localhost:3306 -db-user=root -db-password=123456 -db-schema=todo

## 客户端

编译：
> cd cmd/client-grpc
>
> go build .

运行：
> .\client-grpc.exe -server=localhost:9090