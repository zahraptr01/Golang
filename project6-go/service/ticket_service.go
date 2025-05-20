package service

import (
	"project6-go/dto"
	"project6-go/handler"
)

func GetAvailableTickets() ([]dto.Ticket, error) {
	return handler.GetTickets()
}
