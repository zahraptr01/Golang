package model

type Tour struct {
	ID            int    `json:"id"`
	Country       string `json:"country"`
	Place         string `json:"place"`
	Description   string `json:"description"`
	Price         int    `json:"price"`
	TourDuration  string `json:"tour_duration"`
	Rating        int    `json:"rating"`
	Image         string `json:"image"`
	People        string `json:"people"`
	FlagImage     string `json:"flag_image"`
	PriceDiscount int    `json:"price_discount"`
}
