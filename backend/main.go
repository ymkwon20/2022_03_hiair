package main

import (
	"fmt"
	"log"
	"net/http"
	"runtime"

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

	//
	log.Println("Started App")
	err := http.ListenAndServe(fmt.Sprintf(":%v", port), m)
	if err != nil {
		log.Fatal(err)
	}

}
