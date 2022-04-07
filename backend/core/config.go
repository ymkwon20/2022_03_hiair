package core

import (
	"log"

	"github.com/spf13/viper"
)

func ReadConfig() {
	viper.SetConfigName("config")
	viper.SetConfigType("yml")
	viper.AddConfigPath("./core")
	if err := viper.ReadInConfig(); err != nil {
		log.Fatalln("cannot read from a config")
	}
}
