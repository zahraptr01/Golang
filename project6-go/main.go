package main

import (
	"fmt"
	"os"
	"project6-go/dto"
	"project6-go/service"
	"project6-go/utils"
	"strconv"
	"time"
)

func displayMenu() {
	fmt.Println("=== Sistem Tiket Online PT GoBus ===")
	fmt.Println("1. Lihat daftar tiket\n2. Pesan tiket\n3. Keluar")
	fmt.Print("Pilih menu (1-3): ")
}

func displayTickets(tickets []dto.Ticket) {
	fmt.Println("\nDaftar Tiket:")
	for _, ticket := range tickets {
		fmt.Printf("- Tujuan: %s, Harga: %d, Stok: %d\n", ticket.Destination, ticket.Price, ticket.Stock)
	}
}

func orderTicket(tickets []dto.Ticket) {
	var name, destination string
	fmt.Print("Masukkan nama Anda: ")
	fmt.Scanln(&name)
	fmt.Print("Masukkan tujuan: ")
	fmt.Scanln(&destination)

	for i, ticket := range tickets {
		if ticket.Destination == destination && ticket.Stock > 0 {
			order := dto.Order{ID: "order-" + strconv.Itoa(int(time.Now().Unix())), Name: name, Destination: ticket.Destination, Price: ticket.Price}
			if err := service.PlaceOrder(order); err != nil {
				fmt.Println("❌ Gagal memesan tiket:", err)
				return
			}
			tickets[i].Stock-- // Update stok
			utils.SaveTickets(tickets)
			fmt.Println("✅ Pemesanan tiket berhasil!")
			return
		}
	}
	fmt.Println("❌ Tiket untuk tujuan tersebut tidak tersedia.")
}

func main() {
	for {
		displayMenu()
		var choice int
		fmt.Scanln(&choice)

		switch choice {
		case 1:
			tickets, err := service.GetAvailableTickets()
			utils.HandleError(err)
			displayTickets(tickets)
		case 2:
			tickets, err := service.GetAvailableTickets()
			utils.HandleError(err)
			orderTicket(tickets)
		case 3:
			fmt.Println("Keluar dari aplikasi.")
			os.Exit(0)
		default:
			fmt.Println("Pilihan tidak valid. Silakan coba lagi.")
		}
	}
}
