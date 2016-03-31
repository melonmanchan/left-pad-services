package main

import (
	"github.com/gin-gonic/gin"
	"strconv"
	"strings"
)

func leftPad(str string, ch string, len int) string {
	return strings.Repeat(ch, len) + str
}

func main() {
	r := gin.Default()
	r.GET("/", func(c *gin.Context) {

		str := c.DefaultQuery("str", "")
		len := c.DefaultQuery("len", "0")
		ch := c.DefaultQuery("ch", " ")

		lenInt, err := strconv.Atoi(len)

		if err != nil {
			lenInt = 0
		}

		c.JSON(200, gin.H{
			"str": leftPad(str, ch, lenInt),
		})
	})
	r.Run(":3000")
}
