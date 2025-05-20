package main

import (
	"project5-go/dto"
	"project5-go/handler"
)

func main() {
	request := dto.NewRequest("Zahra", "Bandung")
	handler.ProcessTicketRequest(request)
}
