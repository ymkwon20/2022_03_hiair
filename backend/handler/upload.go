package handler

import (
	"encoding/json"
	"fmt"
	"io"
	"log"
	"net/http"
	"os"

	"github.com/spf13/viper"
)

const MAX_UPLOAD_IMG_SIZE = 1024 * 1024 * 5  // 5MB
const MAX_UPLOAD_APK_SIZE = 1024 * 1024 * 30 // 30MB

func imgUploadHandler(w http.ResponseWriter, r *http.Request) {

	// 32 MB is the default used by FormFile()
	if err := r.ParseMultipartForm(32 << 20); err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Header().Set("Content-Type", "application/json")

		errMsg := make(map[string]interface{})
		errMsg["msg"] = err.Error()
		jData, _ := json.Marshal(errMsg)
		w.Write(jData)
		return
	}

	// Get a reference to the fileHeaders.
	// They are accessible only after ParseMultipartForm is called
	files := r.MultipartForm.File["file"]

	log.Println(files)

	for _, fileHeader := range files {
		// Restrict the size of each uploaded file to 20MB.
		// To prevent the aggregate size from exceeding
		// a specified value, use the http.MaxBytesReader() method
		// before calling ParseMultipartForm()

		if fileHeader.Size > MAX_UPLOAD_IMG_SIZE {

			w.WriteHeader(http.StatusInternalServerError)
			w.Header().Set("Content-Type", "application/json")

			errMsg := make(map[string]interface{})
			errMsg["msg"] = fmt.Sprintf("The uploaded image is too big: %s. Please use an image less than 1MB in size", fileHeader.Filename)

			jData, _ := json.Marshal(errMsg)
			w.Write(jData)

			return
		}

		// Open the file
		file, err := fileHeader.Open()
		if err != nil {
			w.WriteHeader(http.StatusInternalServerError)
			w.Header().Set("Content-Type", "application/json")

			errMsg := make(map[string]interface{})
			errMsg["msg"] = err.Error()
			jData, _ := json.Marshal(errMsg)
			w.Write(jData)

			return
		}

		defer file.Close()

		buff := make([]byte, 512)
		_, err = file.Read(buff)
		if err != nil {
			w.WriteHeader(http.StatusInternalServerError)
			w.Header().Set("Content-Type", "application/json")

			errMsg := make(map[string]interface{})
			errMsg["msg"] = err.Error()
			jData, _ := json.Marshal(errMsg)
			w.Write(jData)

			return
		}

		filetype := http.DetectContentType(buff)
		if filetype != "image/jpeg" && filetype != "image/png" {
			w.WriteHeader(http.StatusBadRequest)
			w.Header().Set("Content-Type", "application/json")

			errMsg := make(map[string]interface{})
			errMsg["msg"] = "The provided file format is not allowed. Please upload a JPEG or PNG"
			jData, _ := json.Marshal(errMsg)
			w.Write(jData)

			return
		}

		_, err = file.Seek(0, io.SeekStart)
		if err != nil {

			w.WriteHeader(http.StatusBadRequest)
			w.Header().Set("Content-Type", "application/json")

			errMsg := make(map[string]interface{})
			errMsg["msg"] = err.Error()
			jData, _ := json.Marshal(errMsg)
			w.Write(jData)

			return
		}

		dirName := viper.GetString(`image-path`)

		err = os.MkdirAll(dirName, os.ModePerm)
		if err != nil {

			w.WriteHeader(http.StatusInternalServerError)
			w.Header().Set("Content-Type", "application/json")

			errMsg := make(map[string]interface{})
			errMsg["msg"] = err.Error()
			jData, _ := json.Marshal(errMsg)
			w.Write(jData)

			return
		}

		fmt.Println(fileHeader.Filename)

		f, err := os.Create(fmt.Sprintf("%s/%s", dirName, fileHeader.Filename))
		if err != nil {

			w.WriteHeader(http.StatusInternalServerError)
			w.Header().Set("Content-Type", "application/json")

			errMsg := make(map[string]interface{})
			errMsg["msg"] = err.Error()
			jData, _ := json.Marshal(errMsg)
			w.Write(jData)

			return
		}

		defer f.Close()

		_, err = io.Copy(f, file)
		if err != nil {

			w.WriteHeader(http.StatusInternalServerError)
			w.Header().Set("Content-Type", "application/json")

			errMsg := make(map[string]interface{})
			errMsg["msg"] = err.Error()
			jData, _ := json.Marshal(errMsg)
			w.Write(jData)

			return
		}
	}

	w.WriteHeader(http.StatusOK)
	w.Header().Set("Content-Type", "application/json")

	errMsg := make(map[string]interface{})
	errMsg["msg"] = "uploaded successfully"
	jData, _ := json.Marshal(errMsg)

	w.Write(jData)
}
