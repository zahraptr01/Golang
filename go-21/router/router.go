package router

import (
	"go-21/handler"
	// "go-21/middleware"
	"net/http"

	"github.com/go-chi/chi/v5"
)

func NewRouter(h *handler.TourHandler) http.Handler {
	r := chi.NewRouter()
	// r.Use(middleware.BasicAuth)

	r.Get("/", h.GetTours)

	return r
}
