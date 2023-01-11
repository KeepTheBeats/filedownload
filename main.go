package main

import (
	"fmt"
	"os"
	"os/exec"

	_ "filedownload/routers"
	"github.com/astaxie/beego"
)

func main() {
	var downloadUrl, downloadPath string = "/download", "download"
	httpPort := beego.AppConfig.String("httpport")
	currentPath, err := exec.LookPath(os.Args[0])
	if err != nil {
		beego.Error("get current path error: %s", err.Error())
	}
	beego.SetStaticPath(downloadUrl, downloadPath)
	beego.Info(fmt.Sprintf("Put the files in the path %s/%s. Then others can download them at http://:%s%s/{filename}", currentPath, downloadPath, httpPort, downloadUrl))
	beego.Run()
}
