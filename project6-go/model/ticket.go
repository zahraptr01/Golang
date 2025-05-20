package model

import "project6-go/dto"

type TicketModel struct {
	Tickets []dto.Ticket
}

func (tm *TicketModel) LoadTickets() error {
	// Implementation to load tickets from a file
	return nil
}
