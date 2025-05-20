package service

import (
	"project6-go/dto"
	"project6-go/handler"
)

func PlaceOrder(order dto.Order) error {
	return handler.SaveOrder(order)
}
