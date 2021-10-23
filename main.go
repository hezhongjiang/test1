package main

import (
	"github.com/gin-gonic/gin"
	"k8s.io/klog/v2"
)

type List struct {
	Users []string `json:"users"`
}

func main(){
	var err error
	route := gin.Default()
	route.GET("/page", func(c *gin.Context) {
		c.JSON(200,"hello world")
	})

	route.GET("/user.json", func(c *gin.Context) {
		l := List{make([]string,0)}
		l.Users = append(l.Users, "zhangsan","lisi")
		c.JSON(200, l)
	})

	err =route.Run(":3000")
	if err != nil {
		klog.Errorln("端口已被占用")
		panic(err)
	}
}
