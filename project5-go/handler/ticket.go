package handler

import (
	"fmt"
	"project5-go/dto"
	"project5-go/service"
)

func ProcessTicketRequest(request dto.Request) {
	if err := request.Validate(); err != nil {
		fmt.Println("Validasi gagal:", err.Error())
		return
	}

	response := service.CheckTicketPrice(request)

	fmt.Println("=== Harga Tiket ===")
	fmt.Printf("Penumpang : %s\n", response.Name)
	fmt.Printf("Tujuan    : %s\n", response.Destination)
	fmt.Printf("Harga     : Rp %.2f\n", response.Price)
	fmt.Println("===================")
}
