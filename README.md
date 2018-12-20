# dev

- 下载 [protobuf](https://github.com/protocolbuffers/protobuf/releases) 编译工具，将 `bin` 加入到环境变量
- 下载安装 `golang` 版本的插件
  > go get -u github.com/golang/protobuf/protoc-gen-go
- 编译
  > protoc --proto_path=api/proto/v1 --proto_path=third_party --go_out=plugins=grpc:pkg/api/v1 todo-service.proto
