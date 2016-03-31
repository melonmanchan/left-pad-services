package main

import (
	"github.com/gin-gonic/gin"
	"strconv"
)

func leftPad(str string, padLen int, ch string) string {
	i := 0
	length := padLen - len(str)

	for i < length {
		i = i + 1
		str = ch + str
	}

	return str
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
			"str": leftPad(str, lenInt, ch),
		})
	})
	r.Run(":3000")
}
