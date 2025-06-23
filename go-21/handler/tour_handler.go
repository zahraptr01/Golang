package handler

import (
	"encoding/json"
	"net/http"

	logger "go-21/looger"
	"go-21/service"
	"go-21/utils"

	"go.uber.org/zap"
)

type TourHandler struct {
	service service.TourService
}

func NewTourHandler(s service.TourService) *TourHandler {
	return &TourHandler{service: s}
}

func (h *TourHandler) GetTours(w http.ResponseWriter, r *http.Request) {
	tours, err := h.service.GetAllTours()
	if err != nil {
		logger.Log.Error("Failed to fetch tours", zap.Error(err))
		http.Error(w, "Internal Server Error", http.StatusInternalServerError)
		return
	}

	tours = utils.FormatTourData(tours)

	resp := map[string]interface{}{
		"status":  true,
		"message": "success get data",
		"data":    tours,
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(resp)
}
