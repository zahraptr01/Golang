package model

import "project6-go/dto"

type OrderModel struct {
	Orders []dto.Order
}

func (om *OrderModel) LoadOrders() error {
	// Implementation to load order from file
	return nil
}
