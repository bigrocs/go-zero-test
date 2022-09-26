.PHONY: git
git:
	git add .
	git commit -m"自动提交 git 代码"
	git push
.PHONY: tag
tag:
	git push --tags
.PHONY: rpc
rpc:
	goctl rpc protoc ./user/rpc/user.proto --go_out=./user/rpc/types --go-grpc_out=./user/rpc/types --zrpc_out=./user/rpc/
.PHONY: api
api:
	goctl api go -api ./order/api/order.api -dir ./order/api
	
.PHONY: docker
docker:
	docker build -f Dockerfile  -t institution-api .
.PHONY: docker
docker:
	docker-compose up
test:
	go test main_test.go -test.v