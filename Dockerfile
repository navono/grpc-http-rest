FROM golang:1.11.4 as builder
WORKDIR  $PWD/.

# 开启 go mod
ENV GO111MODULE=on CGO_ENABLED=0 GOOS=linux

# 设置代理，因为需要下载 google 的包
ENV http_proxy=http://192.168.200.101:1080
ENV https_proxy=http://192.168.200.101:1080

# 拷贝 mod 文件
COPY ./go.mod ./go.sum ./

# 下载依赖包
RUN go mod download

# 拷贝源文件
COPY ./ .

# 编译
RUN go build -a -installsuffix cgo -v -o /todo-service ./cmd/server/main.go

FROM scratch
WORKDIR /bin/
COPY --from=builder /todo-service .

ENTRYPOINT [ "/bin/todo-service" ]
# CMD [ "grpc-port", "9090", "http-port", "8080", "db-host", "localhost:3306", "db-user", "root", "db-password", "123456", "db-schema", "todo", "log-level", "1", "log-time-format", "2006-01-02T15:04:05.999999999Z07:00" ]

EXPOSE 8080 9090