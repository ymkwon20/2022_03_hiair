package infrastructure

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"time"

	_ "github.com/denisenkom/go-mssqldb"
	"github.com/spf13/viper"
)

type MsSqlDatabase struct {
	db *sql.DB
}

func NewMsSqlDatabase() IDatabase {
	address := viper.GetString("database.address")
	port := viper.GetString("database.port")
	schema := viper.GetString("database.schema")
	user := viper.GetString("database.user")
	pwd := viper.GetString("database.pwd")

	connString := fmt.Sprintf("sqlserver://%s:%s@%s:%s?database=%s", user, pwd, address, port, schema)

	database, err := sql.Open("sqlserver", connString)
	if err != nil {
		log.Fatalln("Open connection failed", err.Error())
	}
	return &MsSqlDatabase{db: database}
}

func (m *MsSqlDatabase) Close() {
	m.db.Close()
}

func (m *MsSqlDatabase) CallProcedure(query string) ([]interface{}, error) {
	var results []interface{}
	var err error

	ctx, cancel := context.WithTimeout(context.Background(), 30*time.Second)
	defer cancel()

	log.Print(query)

	rows, err := m.db.QueryContext(ctx, query)
	if err != nil {
		return results, err
	}
	defer rows.Close()

	cols, _ := rows.Columns()

	for rows.Next() {
		// Create a slice of interface{}'s to represent each column
		// and a second slice to contain pointers to each item in the columns slice
		columns := make([]interface{}, len(cols))
		columnPointers := make([]interface{}, len(cols))
		for i := range columns {
			columnPointers[i] = &columns[i]
		}
		// Scan the result into the column pointers
		if err := rows.Scan(columnPointers...); err != nil {
			return results, err
		}

		// Create map, and retrieve the value for each column from the pointers slice,
		// storing it in the map with the name of the column as the key.
		m := make(map[string]interface{})
		for i, colName := range cols {
			val := columnPointers[i].(*interface{})

			m[colName] = *val

		}

		// Outputs: map[columnName:value, columnName2: value2, ...]
		results = append(results, m)
	}

	return results, err
}

func (m *MsSqlDatabase) CallDML(query string) ([]interface{}, error) {
	var results []interface{}
	var err error

	ctx, cancel := context.WithTimeout(context.Background(), 30*time.Second)
	defer cancel()

	log.Print(query)

	rows, err := m.db.ExecContext(ctx, query)
	if err != nil {
		return results, err
	}

	rowsCnt, err := rows.RowsAffected()
	if err != nil {
		return results, err
	}

	if rowsCnt < 1 {
		err = fmt.Errorf("저장된 데이터가 없음")
		return results, err
	}

	return results, err
}
