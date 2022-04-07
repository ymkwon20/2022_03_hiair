package handler

import (
	"encoding/json"
	"fmt"
	"net/http"

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
		errMsg["msg"] = "internal error"
		jData, _ := json.Marshal(errMsg)
		w.Write(jData)
		return

	}
	jData, err := json.Marshal(results)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Header().Set("Content-Type", "application/json")

		errMsg := make(map[string]interface{})
		errMsg["msg"] = "serialization error"
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
		errMsg["msg"] = "internal error"
		jData, _ := json.Marshal(errMsg)
		w.Write(jData)
		return

	}
	jData, err := json.Marshal(results)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Header().Set("Content-Type", "application/json")

		errMsg := make(map[string]interface{})
		errMsg["msg"] = "serialization error"
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
		errMsg["msg"] = "internal error"
		jData, _ := json.Marshal(errMsg)
		w.Write(jData)
		return

	}
	jData, err := json.Marshal(results)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Header().Set("Content-Type", "application/json")

		errMsg := make(map[string]interface{})
		errMsg["msg"] = "serialization error"
		jData, _ := json.Marshal(errMsg)
		w.Write(jData)
		return

	}
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	w.Write(jData)
}
