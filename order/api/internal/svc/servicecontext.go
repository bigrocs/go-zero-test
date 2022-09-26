package svc

import (
	"go-zero-test/order/api/internal/config"
	"go-zero-test/user/rpc/userclient"

	"github.com/zeromicro/go-zero/zrpc"
)

type ServiceContext struct {
	Config        config.Config
	UserRpcClient userclient.User
}

func NewServiceContext(c config.Config) *ServiceContext {
	return &ServiceContext{
		Config:        c,
		UserRpcClient: userclient.NewUser(zrpc.MustNewClient(c.UserRpcClient)),
	}
}
