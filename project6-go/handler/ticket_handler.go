package handler

import (
	"encoding/json"
	"os"
	"project6-go/dto"
)

// GetTickets reads tickets from a JSON file
func GetTickets() ([]dto.Ticket, error) {
	data, err := os.ReadFile("data/tickets.json")
	if err != nil {
		return nil, err
	}
	var tickets []dto.Ticket
	if err := json.Unmarshal(data, &tickets); err != nil {
		return nil, err
	}
	return tickets, nil
}

// SaveTickets saves tickets to a JSON file with the most beautiful formatting
func SaveTickets(tickets []dto.Ticket) error {
	formattedData, err := json.MarshalIndent(tickets, "", "    ")
	if err != nil {
		return err
	}
	return os.WriteFile("data/tickets.json", formattedData, 0644)
}
