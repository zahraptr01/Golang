package dto

type Ticket struct {
	Destination string `json:"destination"`
	Price       int    `json:"price"`
	Stock       int    `json:"stock"`
}
