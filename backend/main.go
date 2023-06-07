package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
	"runtime"
	"time"

	"github.com/spf13/viper"
	"hitecis.co.kr/hiair/core"
	"hitecis.co.kr/hiair/handler"
)

func main() {

	// load configuration
	core.ReadConfig()

	port := viper.GetString(`server.port`)

	/// set up cpu core
	runtime.GOMAXPROCS(runtime.NumCPU())

	/// load handler
	m := handler.MakeHandler()
	defer m.Close()

	t := time.Now()
	today := fmt.Sprintf("%04d%02d%02d", t.Year(), t.Month(), t.Day())
	dirName := viper.GetString(`log-path`)

	logFile, f_err := os.OpenFile(dirName+"\\"+today+".txt", os.O_CREATE|os.O_WRONLY|os.O_APPEND, 0666)
	if f_err != nil {
		panic(f_err)
	}
	defer logFile.Close()

	multiWriter := io.MultiWriter(logFile, os.Stdout)
	log.SetOutput(multiWriter)

	//
	log.Println("Started App")
	err := http.ListenAndServe(fmt.Sprintf(":%v", port), m)
	if err != nil {
		log.Fatal(err)
	}
}
