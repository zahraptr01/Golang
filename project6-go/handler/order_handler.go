package handler

import (
	"encoding/json"
	"os"
	"project6-go/dto"
)

func SaveOrder(order dto.Order) error {
	data, err := os.ReadFile("data/orders.json")
	if err != nil {
		return err
	}
	var orders []dto.Order
	if err := json.Unmarshal(data, &orders); err != nil {
		return err
	}

	// Add a new order to the list
	orders = append(orders, order)

	// Create a formatted JSON file
	formattedData, err := json.MarshalIndent(orders, "", "    ") // Menggunakan indentasi 4 spasi
	if err != nil {
		return err
	}

	// Save formatted data to a file
	return os.WriteFile("data/orders.json", formattedData, 0644)
}
