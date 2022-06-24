package handler

import (
	"encoding/json"
	"fmt"
	"io"
	"io/ioutil"
	"net/http"
	"os"
	"strconv"

	"github.com/gorilla/mux"
	"github.com/spf13/viper"
)

func (a *AppHandler) fetchApkInfo(w http.ResponseWriter, r *http.Request) {

	query := `
	EXEC SP_TABLET_APK_SELECT;
	`

	results, err := a.db.CallProcedure(query)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Header().Set("Content-Type", "application/json")

		errMsg := make(map[string]interface{})
		errMsg["msg"] = err.Error()
		jData, _ := json.Marshal(errMsg)
		w.Write(jData)
		return

	}
	jData, err := json.Marshal(results)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Header().Set("Content-Type", "application/json")

		errMsg := make(map[string]interface{})
		errMsg["msg"] = err.Error()
		jData, _ := json.Marshal(errMsg)
		w.Write(jData)
		return

	}
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	w.Write(jData)

}

func (a *AppHandler) downloadApk(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	version, ok := vars["version"]

	if !ok {
		w.WriteHeader(http.StatusInternalServerError)
		w.Header().Set("Content-Type", "application/json")

		errMsg := make(map[string]interface{})
		errMsg["msg"] = "version is invalid"
		jData, _ := json.Marshal(errMsg)
		w.Write(jData)
		return

	}

	rootPath := viper.Get("apk-path")
	filePath := fmt.Sprintf("%s/%s/", rootPath, version)

	files, err := ioutil.ReadDir(filePath)

	if err != nil {
		http.Error(w, "Version not found.", http.StatusNotFound)
	}

	// 혼동이 없도록 apk 혹은 appbundle 파일은 무조건 1개만 존재해야함
	if len(files) != 1 {
		http.Error(w, "file count should be only one", http.StatusBadRequest)
	}

	fileName := files[0].Name()

	Openfile, err := os.Open(fmt.Sprintf("%s%s", filePath, fileName)) //Open the file to be downloaded later
	if err != nil {
		http.Error(w, err.Error(), http.StatusNotFound)
		return
	}

	defer Openfile.Close() //Close after function return

	if err != nil {
		http.Error(w, "File not found.", http.StatusNotFound) //return 404 if file is not found
		return
	}

	tempBuffer := make([]byte, 512) //Create a byte array to read the file later
	Openfile.Read(tempBuffer)       //Read the file into  byte
	// FileContentType := http.DetectContentType(tempBuffer) //Get file header

	FileStat, _ := Openfile.Stat()                     //Get info from file
	FileSize := strconv.FormatInt(FileStat.Size(), 10) //Get file size as a string

	//Set the headers
	w.Header().Set("Content-Disposition", "attachment; filename="+strconv.Quote(fileName))
	w.Header().Set("Content-Type", "application/octet-stream")
	w.Header().Set("Content-Length", FileSize)

	Openfile.Seek(0, 0)  //We read 512 bytes from the file already so we reset the offset back to 0
	io.Copy(w, Openfile) //'Copy' the file to the client
}
