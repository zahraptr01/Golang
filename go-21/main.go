package main

import (
	"go-21/database"
	"go-21/handler"
	logger "go-21/looger"
	"go-21/repository"
	"go-21/router"
	"go-21/service"
	"log"
	"net/http"

	"go.uber.org/zap"
)

func main() {
	logger.InitLogger()
	defer logger.Log.Sync()

	db, err := database.InitDB()
	if err != nil {
		logger.Log.Fatal("Database error", zap.Error(err))
	}

	repo := repository.NewTourRepository(db)
	svc := service.NewTourService(repo)
	h := handler.NewTourHandler(svc)

	r := router.NewRouter(h)

	logger.Log.Info("Server running at http://localhost:8080")
	log.Fatal(http.ListenAndServe(":8080", r))
}
