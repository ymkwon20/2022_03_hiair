package handler

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/codegangsta/negroni"
	"github.com/gorilla/mux"
	infrastructure "hitecis.co.kr/hiair/infrastructure/database"
)

type AppHandler struct {
	http.Handler
	db infrastructure.IDatabase
}

func MakeHandler() *AppHandler {
	r := mux.NewRouter()

	n := negroni.New()

	n.UseHandler(r)

	a := &AppHandler{
		Handler: n,
		db:      infrastructure.NewMsSqlDatabase(),
	}

	r.HandleFunc("/", a.getIndex).Methods("GET")
	r.HandleFunc("/cut", a.getCuttings).Methods("GET")
	r.HandleFunc("/cut/req", a.getCuttingRequest).Methods("GET")
	r.HandleFunc("/cut/check", a.getCuttingCheckSheet).Methods("GET")
	r.HandleFunc("/cut/check", a.saveCuttingCheck).Methods("POST")
	r.HandleFunc("/sign-in", a.signIn).Methods("POST")
	r.HandleFunc("/qm", a.getQmItemsByWbCd).Methods("GET")
	r.HandleFunc("/qm", a.saveQmItem).Methods("POST")
	r.HandleFunc("/qms", a.saveQmList).Methods("POST")
	r.HandleFunc("/fct", a.getFctSerial).Methods("GET")
	r.HandleFunc("/fct/{serial}", a.getFctItem).Methods("GET")
	r.HandleFunc("/fct", a.saveFctItem).Methods("POST")
	r.HandleFunc("/apk", a.fetchApkInfo).Methods("GET")
	r.HandleFunc("/apk/{version}", a.downloadApk).Methods("GET")

	return a
}

func (a *AppHandler) Close() {
	a.db.Close()
}

func (a *AppHandler) getIndex(w http.ResponseWriter, r *http.Request) {

	w.WriteHeader(http.StatusOK)
	fmt.Fprintf(w, "Hello world")
}

func (a *AppHandler) getCuttings(w http.ResponseWriter, r *http.Request) {

	query := `
	EXEC SP_TABLET_FCT_01_SELECT;
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

func (a *AppHandler) getCuttingRequest(w http.ResponseWriter, r *http.Request) {

	queryString := r.URL.Query()
	reqDate := queryString.Get("date")
	reqSeq := queryString.Get("seq")

	query := fmt.Sprintf(`
	EXEC SP_TABLET_FCT_02_SELECT '%s', '%s';
	`, reqDate, reqSeq)

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

func (a *AppHandler) getCuttingCheckSheet(w http.ResponseWriter, r *http.Request) {

	queryString := r.URL.Query()
	reqDate := queryString.Get("date")
	reqSeq := queryString.Get("seq")

	query := fmt.Sprintf(`
	EXEC SP_TABLET_FCT_03_SELECT '%s', '%s';
	`, reqDate, reqSeq)

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

func (a *AppHandler) saveCuttingCheck(w http.ResponseWriter, r *http.Request) {
	var params map[string]interface{}

	if err := json.NewDecoder(r.Body).Decode(&params); err != nil {
		w.WriteHeader(http.StatusBadRequest)
		w.Header().Set("Content-Type", "application/json")

		errMsg := make(map[string]interface{})
		errMsg["msg"] = err.Error()
		jData, _ := json.Marshal(errMsg)
		w.Write(jData)
		return
	}

	query := fmt.Sprintf(`
	EXEC SP_TABLET_FCT_03_MERGE '%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s';
	`,
		params["date"],
		params["seq"],
		params["wo-nb"],
		params["thickness"],
		params["width"],
		params["height"],
		params["angle"],
		params["lot"],
		params["work-id"],
		params["equip-cd"],
		params["remark"],
		params["user-id"],
	)

	_, err := a.db.CallDML(query)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Header().Set("Content-Type", "application/json")

		errMsg := make(map[string]interface{})
		errMsg["msg"] = err.Error()
		jData, _ := json.Marshal(errMsg)
		w.Write(jData)
		return

	}

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
}

func (a *AppHandler) signIn(w http.ResponseWriter, r *http.Request) {
	var params map[string]interface{}

	if err := json.NewDecoder(r.Body).Decode(&params); err != nil {
		w.WriteHeader(http.StatusBadRequest)
		w.Header().Set("Content-Type", "application/json")

		errMsg := make(map[string]interface{})
		errMsg["msg"] = err.Error()
		jData, _ := json.Marshal(errMsg)
		w.Write(jData)
		return
	}

	query := fmt.Sprintf(`
	EXEC SP_TABLET_LOG_01_SELECT '%s';
	`, params["id"])

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

func (a *AppHandler) getQmItemsByWbCd(w http.ResponseWriter, r *http.Request) {

	queryString := r.URL.Query()
	wbCd := queryString.Get("wb-cd")
	rawPage := queryString.Get("page")

	page, err := strconv.Atoi(rawPage)
	if err != nil {
		errMsg := make(map[string]interface{})
		errMsg["msg"] = err.Error()
		jData, _ := json.Marshal(errMsg)
		w.Write(jData)
		return
	}

	currentQuery := fmt.Sprintf(`
	EXEC SP_TABLET_ORD_01_SELECT '%s', '%s';
	`, wbCd, strconv.Itoa(page))

	// 다음 차수 조회시 오
	nextQuery := fmt.Sprintf(`
	EXEC SP_TABLET_ORD_01_SELECT '%s', '%s';
	`, wbCd, strconv.Itoa(page+1))

	results, err := a.db.CallProcedure(currentQuery)
	if err != nil {
		log.Print(err)
		w.WriteHeader(http.StatusInternalServerError)
		w.Header().Set("Content-Type", "application/json")

		errMsg := make(map[string]interface{})
		errMsg["msg"] = err.Error()
		jData, _ := json.Marshal(errMsg)
		w.Write(jData)
		return
	}

	nextResults, err := a.db.CallProcedure(nextQuery)
	if err != nil {
		log.Print(err)
		w.WriteHeader(http.StatusInternalServerError)
		w.Header().Set("Content-Type", "application/json")

		errMsg := make(map[string]interface{})
		errMsg["msg"] = err.Error()
		jData, _ := json.Marshal(errMsg)
		w.Write(jData)
		return
	}

	var isNextAvailable bool
	if len(nextResults) == 0 {
		isNextAvailable = false
	} else {
		isNextAvailable = true
	}

	data := make(map[string]interface{})
	data["is_next_available"] = isNextAvailable

	data["data"] = results

	response, err := json.Marshal(data)
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
	w.Write(response)
}

func (a *AppHandler) saveQmItem(w http.ResponseWriter, r *http.Request) {
	var params map[string]interface{}

	if err := json.NewDecoder(r.Body).Decode(&params); err != nil {
		w.WriteHeader(http.StatusBadRequest)
		w.Header().Set("Content-Type", "application/json")

		errMsg := make(map[string]interface{})
		errMsg["msg"] = err.Error()
		jData, _ := json.Marshal(errMsg)
		w.Write(jData)
		return
	}

	query := fmt.Sprintf(`
	EXEC  SP_TABLET_ORD_01_UPDATE '%s', '%s', '%s', '%s', '%s', '%s';
	`, params["plan-seq"], params["wo-nb"], params["wb-cd"], params["prod-gb"], params["date"], params["qty"])

	_, err := a.db.CallDML(query)
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

}

func (a *AppHandler) saveQmList(w http.ResponseWriter, r *http.Request) {
	var paramsList []map[string]interface{}

	if err := json.NewDecoder(r.Body).Decode(&paramsList); err != nil {
		w.WriteHeader(http.StatusBadRequest)
		w.Header().Set("Content-Type", "application/json")

		errMsg := make(map[string]interface{})
		errMsg["msg"] = err.Error()
		jData, _ := json.Marshal(errMsg)
		w.Write(jData)
		return
	}

	for i := 0; i < len(paramsList); i++ {
		params := paramsList[i]

		query := fmt.Sprintf(`
		EXEC  SP_TABLET_ORD_01_UPDATE '%s', '%s', '%s', '%s', '%s', '%s';
		`, params["plan-seq"], params["wo-nb"], params["wb-cd"], params["prod-gb"], params["date"], params["qty"])

		_, err := a.db.CallDML(query)
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

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)

}

func (a *AppHandler) getFctSerial(w http.ResponseWriter, r *http.Request) {

	query := `
	EXEC SP_TABLET_FCT_04_SELECT;
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

func (a *AppHandler) getFctItem(w http.ResponseWriter, r *http.Request) {

	vars := mux.Vars(r)

	if vars["serial"] == "" {

		w.WriteHeader(http.StatusBadRequest)
		w.Header().Set("Content-Type", "application/json")

		errMsg := make(map[string]interface{})
		errMsg["msg"] = "send a wrong path parameter"
		jData, _ := json.Marshal(errMsg)
		w.Write(jData)
		return
	}

	query := fmt.Sprintf(`
	EXEC SP_TABLET_FCT_05_SELECT '%s';
	`, vars["serial"])

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

func (a *AppHandler) saveFctItem(w http.ResponseWriter, r *http.Request) {
	var paramsList []map[string]interface{}

	if err := json.NewDecoder(r.Body).Decode(&paramsList); err != nil {
		w.WriteHeader(http.StatusBadRequest)
		w.Header().Set("Content-Type", "application/json")

		errMsg := make(map[string]interface{})
		errMsg["msg"] = err.Error()
		jData, _ := json.Marshal(errMsg)
		w.Write(jData)
		return
	}

	for i := 0; i < len(paramsList); i++ {
		params := paramsList[i]

		query := fmt.Sprintf(`
	EXEC  SP_TABLET_FCT_05_UPDATE '%s', '%s', '%s', '%s', '%s', '%s','%s';
	`, params["date"], params["seq"], params["wb-cd"], params["metal"], params["remark"], params["qty"], params["user-id"])

		_, err := a.db.CallDML(query)
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

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)

}
