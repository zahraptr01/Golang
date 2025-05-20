package service

import (
	"project5-go/data"
	"project5-go/dto"
)

func CheckTicketPrice(req dto.Request) dto.Response {
	price := data.Destinations[req.Destination]
	return dto.Response{
		Name:        req.Name,
		Destination: req.Destination,
		Price:       price,
	}
}
