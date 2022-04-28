package infrastructure

type IDatabase interface {
	CallProcedure(query string) ([]interface{}, error)
	CallDML(query string) ([]interface{}, error)
	Close()
}
