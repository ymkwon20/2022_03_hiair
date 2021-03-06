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
	r.HandleFunc("/order", a.getWorkOrderByWbCd).Methods("GET")
	r.HandleFunc("/order", a.saveWorkOrder).Methods("POST")
	r.HandleFunc("/orders", a.saveWorkOrderList).Methods("POST")
	r.HandleFunc("/qm", a.getQmItems).Methods("GET")
	r.HandleFunc("/qm", a.saveQmItem).Methods("POST")
	r.HandleFunc("/fct", a.getFctSerial).Methods("GET")
	r.HandleFunc("/fct/{serial}", a.getFctItem).Methods("GET")
	r.HandleFunc("/fct", a.saveFctItem).Methods("POST")
	r.HandleFunc("/apk", a.fetchApkInfo).Methods("GET")
	r.HandleFunc("/apk/{version}", a.downloadApk).Methods("GET")
	r.HandleFunc("/checklist", a.getChecklist).Methods("GET")
	r.HandleFunc("/checklist", a.saveCheckitem).Methods("POST")
	r.HandleFunc("/checklist/images", a.getCheckimagelist).Methods("GET")
	r.HandleFunc("/checklist/images", a.saveCheckimage).Methods("POST")
	r.HandleFunc("/unit", a.getUnitlist).Methods("GET")
	r.HandleFunc("/wb", a.getWorkbaselist).Methods("GET")
	r.HandleFunc("/menu", a.getQmMenulist).Methods("GET")
	r.HandleFunc("/images", imgUploadHandler).Methods("POST")
	r.HandleFunc("/safety", a.getSafetyInfos).Methods("GET")
	r.HandleFunc("/safety/{code}", a.getSafetyItems).Methods("GET")
	r.HandleFunc("/safety", a.saveSafetyChecks).Methods("POST")
	r.HandleFunc("/safety/repair", a.saveSafetyRepair).Methods("POST")

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

func (a *AppHandler) getWorkOrderByWbCd(w http.ResponseWriter, r *http.Request) {

	queryString := r.URL.Query()
	wbCd := queryString.Get("wb-cd")
	wcCd := queryString.Get("wc-cd")
	rawPage := queryString.Get("page")

	page, err := strconv.Atoi(rawPage)
	if err != nil {
		errMsg := make(map[string]interface{})
		errMsg["msg"] = err.Error()
		jData, _ := json.Marshal(errMsg)
		w.Write(jData)
		return
	}

	query := fmt.Sprintf(`
	EXEC SP_TABLET_ORD_02_SELECT '%s', '%s', '%s';
	`, wcCd, wbCd, strconv.Itoa(page))

	results, err := a.db.CallProcedure(query)
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
	if results == nil {
		isNextAvailable = false
	} else if len(results) == 0 {
		isNextAvailable = false
	} else {
		isNextAvailable = results[0].(map[string]interface{})["CAN_LOAD_NEXT"].(bool)
	}

	data := make(map[string]interface{})
	data["is_next_available"] = isNextAvailable

	if results == nil {
		results = make([]interface{}, 0)
	}

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

func (a *AppHandler) saveWorkOrder(w http.ResponseWriter, r *http.Request) {
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
	EXEC  SP_TABLET_ORD_02_UPDATE '%s', '%s', '%s', '%s', '%s', '%s', '%s';
	`, params["plan-seq"], params["wo-nb"], params["wc-cd"], params["wb-cd"], params["prod-gb"], params["date"], params["qty"])

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

func (a *AppHandler) saveWorkOrderList(w http.ResponseWriter, r *http.Request) {
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

func (a *AppHandler) getChecklist(w http.ResponseWriter, r *http.Request) {

	queryString := r.URL.Query()
	prodPlanSeq := queryString.Get("plan-seq")
	woNb := queryString.Get("wo-nb")
	wbCd := queryString.Get("wb-cd")
	wcCd := queryString.Get("wc-cd")
	pageCd := queryString.Get("page-cd")

	query := fmt.Sprintf(`
	EXEC SP_TABLET_QML_03_SELECT '%s', '%s', '%s', '%s', '%s';
	`, prodPlanSeq, woNb, wcCd, wbCd, pageCd)

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

func (a *AppHandler) getCheckimagelist(w http.ResponseWriter, r *http.Request) {

	queryString := r.URL.Query()
	prodPlanSeq := queryString.Get("plan-seq")
	woNb := queryString.Get("wo-nb")
	wbCd := queryString.Get("wb-cd")
	wcCd := queryString.Get("wc-cd")

	query := fmt.Sprintf(`
	EXEC SP_TABLET_PHT_01_SELECT '%s', '%s', '%s', '%s';
	`, prodPlanSeq, woNb, wcCd, wbCd)

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

func (a *AppHandler) saveCheckitem(w http.ResponseWriter, r *http.Request) {

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
		EXEC  SP_TABLET_QML_03_MERGE '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s';`,
			params["seq"], params["wo-nb"], params["wc-cd"], params["wb-cd"], params["cks-cd"], params["cks-nm"], params["cks-val"],
			params["cks-type"], params["bas-cd"], params["bas-val"], params["unit"], params["unit-cbo-cd"], params["value-cbo-cd"],
			params["div-cd"], params["pht-cd"], params["user-id"], params["org1-fn"], params["new1-fn"],
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

	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)

}

func (a *AppHandler) saveCheckimage(w http.ResponseWriter, r *http.Request) {

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
		EXEC  SP_TABLET_PHT_01_MERGE '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s';`,
			params["plan-seq"], params["wo-nb"], params["wc-cd"], params["wb-cd"], params["seq"], params["user-id"], params["name"],
			params["name"], params["remark"],
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

	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)

}

func (a *AppHandler) getUnitlist(w http.ResponseWriter, r *http.Request) {

	queryString := r.URL.Query()
	code := queryString.Get("code")

	query := fmt.Sprintf(`
	EXEC SP_TABLET_CHK_01_COMBOBOX '%s';
	`, code)

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

func (a *AppHandler) getWorkbaselist(w http.ResponseWriter, r *http.Request) {

	queryString := r.URL.Query()
	code := queryString.Get("code")

	// query := `EXEC SP_TABLET_WBC_01_SELECT;`
	query := fmt.Sprintf(`EXEC SP_TABLET_WCC_01_SELECT '%s';`, code)

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

func (a *AppHandler) getQmMenulist(w http.ResponseWriter, r *http.Request) {

	queryString := r.URL.Query()
	code := queryString.Get("code")

	query := fmt.Sprintf(`
	EXEC SP_TABLET_QML_01_SELECT '%s';
	`, code)

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

func (a *AppHandler) getSafetyInfos(w http.ResponseWriter, r *http.Request) {

	queryString := r.URL.Query()
	code := queryString.Get("code")

	query := fmt.Sprintf(`
	EXEC SP_TABLET_EQP_01_SELECT '%s';
	`, code)

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

func (a *AppHandler) getSafetyItems(w http.ResponseWriter, r *http.Request) {

	vars := mux.Vars(r)
	code := vars["code"]

	queryString := r.URL.Query()
	equipType := queryString.Get("type")
	date := queryString.Get("date")

	if code == "" {

		w.WriteHeader(http.StatusBadRequest)
		w.Header().Set("Content-Type", "application/json")

		errMsg := make(map[string]interface{})
		errMsg["msg"] = "send a wrong path parameter"
		jData, _ := json.Marshal(errMsg)
		w.Write(jData)
		return
	}

	query := fmt.Sprintf(`
	EXEC SP_TABLET_EQP_02_SELECT '%s', '%s', '%s';
	`, code, equipType, date)

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

func (a *AppHandler) saveSafetyChecks(w http.ResponseWriter, r *http.Request) {

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
		EXEC SP_TABLET_EQP_02_INSERT '%s', '%s', '%s', '%s', '%s', '%s', '%s';
		`,
			params["work-code"],
			params["type"],
			params["equip-check"],
			params["standard"],
			params["date"],
			params["value"],
			params["remark"],
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

	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)

}

func (a *AppHandler) saveSafetyRepair(w http.ResponseWriter, r *http.Request) {
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
	EXEC SP_TABLET_EQP_01_MERGE '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s';
	`,
		params["date"],
		params["code"],
		params["location"],
		params["record"],
		params["repaired_by"],
		params["cost"],
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

func (a *AppHandler) getQmItems(w http.ResponseWriter, r *http.Request) {

	//! ????????? ???????????? ??????????????? ??? ????????? ??????

	query := fmt.Sprintf(`
	EXEC SP_TABLET_QML_02_SELECT '%s', '%s', '%s';
	`, "999", "QML", "1")

	results, err := a.db.CallProcedure(query)
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

	// var isNextAvailable bool
	// if results == nil {
	// 	isNextAvailable = false
	// } else if len(results) == 0 {
	// 	isNextAvailable = false
	// } else {
	// 	isNextAvailable = results[0].(map[string]interface{})["CAN_LOAD_NEXT"].(bool)
	// }

	data := make(map[string]interface{})
	// data["is_next_available"] = isNextAvailable

	if results == nil {
		results = make([]interface{}, 0)
	}

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
	EXEC  SP_TABLET_QML_02_UPDATE '%s', '%s', '%s', '%s';
	`, params["plan-seq"], params["wo-nb"], params["date"], params["user-id"])

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
