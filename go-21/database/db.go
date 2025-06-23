package database

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/lib/pq"
)

func InitDB() (*sql.DB, error) {
	// var err error

	host := "localhost"
	port := 5432
	user := "postgres"
	password := "exol930103"
	dbname := "tourdb"

	dsn := fmt.Sprintf("host=%s port=%d user=%s password=%s dbname=%s sslmode=disable",
		host, port, user, password, dbname)

	db, err := sql.Open("postgres", dsn)
	if err != nil {
		log.Println("Failed to open DB:", err)
		return nil, err
	}

	if err = db.Ping(); err != nil {
		log.Println("Failed to connect to DB:", err)
		return nil, err
	}

	fmt.Println("Database connected!")
	return db, nil
}
