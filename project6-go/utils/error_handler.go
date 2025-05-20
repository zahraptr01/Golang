package utils

import (
	"encoding/json"
	"log"
	"os"
	"project6-go/dto"
)

// HandleError menangani kesalahan dengan menampilkan pesan
func HandleError(err error) {
	if err != nil {
		log.Fatalf("Error: %v", err)
	}
}

// SaveTickets menyimpan data tiket ke file JSON dengan format terindah
func SaveTickets(tickets []dto.Ticket) {
	formattedData, err := json.MarshalIndent(tickets, "", "    ") // Menggunakan indentasi 4 spasi
	if err != nil {
		log.Fatalf("Gagal menyimpan tiket: %v", err)
	}
	if err := os.WriteFile("data/tickets.json", formattedData, 0644); err != nil {
		log.Fatalf("Gagal menulis file: %v", err)
	}
}
