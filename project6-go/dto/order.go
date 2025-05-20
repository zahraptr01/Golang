package dto

type Order struct {
	ID          string `json:"id"`
	Name        string `json:"name"`
	Destination string `json:"destination"`
	Price       int    `json:"price"`
}
