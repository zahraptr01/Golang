package main

import "fmt"

// import "fmt"

// type User struct {
// 	Name  string
// 	Email string
// 	Phone string
// 	// Timestamp
// }

// type Product struct {
// 	Name  string
// 	Price float64
// 	// Timestamp
// }

// // type Timestamp struct {
// // 	CreatedAt time.Time
// // 	UpdtaeAt time.Time
// // }

// func main() {

// 	// User_1 := User{}
// 	// User_1.CreatedAt = time.Now()

// 	// person := struct {
// 	// 	name string
// 	// }{
// 	// 	name: "lumos",
// 	// }

// 	products := []Product{}
// 	products = append(products, Product{Name: "tas", Price: 50000})
// 	products = append(products, Product{Name: "baju", Price: 10000})

// 	for _, p := range products {
// 		fmt.Println("Name : ", p.Name, "Price : ", p.Price)
// 	}
// }

// type Shape interface {
// 	Area() float64
// }

// type Circle struct {
// 	Radius float64
// }

// type Square struct {
// 	Sidelength float64
// }

// func (c *Circle) Area() float64 {
// 	return c.Radius * 3
// }

// func (s *Square) Area() float64 {
// 	return s.Sidelength * 2
// }

// func Keliling(shape Shape) float64 {
// 	return shape.Area()
// }

// func main() {
// 	circle := Circle{
// 		Radius: 4,
// 	}

// 	square := Square{
// 		Sidelength: 4,
// 	}

// 	circle_area := Keliling(&circle)
// 	fmt.Println("Keliling Lingkaran : ", circle_area)
// 	square_area := Keliling(&square)
// 	fmt.Println("Keliling Persegi Panjang : ", square_area)
// }

// //  Challenge 1
// type Team struct {
// 	Name  string
// 	Score int
// }

// // Fungsi untuk memperbarui skor
// func updateScore(team *Team, newScore int) {
// 	if newScore > team.Score {
// 		team.Score = newScore
// 	}
// }

// func main() {
// 	tim := Team{Name: "Garuda", Score: 2}

// 	fmt.Println("Sebelum Update:")
// 	fmt.Printf("Tim: %s, Skor: %d\n", tim.Name, tim.Score)

// 	updateScore(&tim, 4)

// 	fmt.Println("Setelah Update:")
// 	fmt.Printf("Tim: %s, Skor: %d\n", tim.Name, tim.Score)
// }

// // Challenge 2
// type Buku struct {
// 	Judul       string
// 	Penulis     string
// 	TahunTerbit int
// }

// // Fungsi filter berdasarkan tahun terbit
// func filterBukuByTahun(bukuList []Buku, tahun int) []Buku {
// 	var hasil []Buku
// 	for _, buku := range bukuList {
// 		if buku.TahunTerbit == tahun {
// 			hasil = append(hasil, buku)
// 		}
// 	}
// 	return hasil
// }

// func main() {
// 	// Inisialisasi 5 data buku
// 	daftarBuku := []Buku{
// 		{"Negeri 5 Menara", "Ahmad Fuadi", 2009},
// 		{"Perahu Kertas", "Dewi Lestari", 2009},
// 		{"Bumi", "Tere Liye", 2014},
// 		{"Bulan", "Tere Liye", 2015},
// 		{"Matahari", "Tere Liye", 2016},
// 	}

// 	// Filter buku berdasarkan tahun 2009
// 	tahun := 2009
// 	bukuFiltered := filterBukuByTahun(daftarBuku, tahun)

// 	// Tampilkan hasil
// 	fmt.Printf("Buku yang terbit tahun %d : \n", tahun)
// 	for _, buku := range bukuFiltered {
// 		fmt.Printf("Judul: %s, Penulis: %s\n", buku.Judul, buku.Penulis)
// 	}
// }

// Challenge 3
type PaymentMethod interface {
	DisplayTutorial()
}

type QRIS struct{}
type EWallet struct{}
type VirtualAccount struct{}

func (q QRIS) DisplayTutorial() {
	fmt.Println("Tutorial Pembayaran via QRIS:")
	fmt.Println("1. Buka aplikasi pembayaran.")
	fmt.Println("2. Scan kode QR.")
	fmt.Println("3. Konfirmasi pembayaran.")
}

func (e EWallet) DisplayTutorial() {
	fmt.Println("Tutorial Pembayaran via E-Wallet:")
	fmt.Println("1. Buka aplikasi E-Wallet.")
	fmt.Println("2. Pilih menu Transfer/Pay.")
	fmt.Println("3. Masukkan nomor tujuan dan nominal.")
	fmt.Println("4. Konfirmasi pembayaran.")
}

func (v VirtualAccount) DisplayTutorial() {
	fmt.Println("Tutorial Pembayaran via Virtual Account:")
	fmt.Println("1. Masuk ke aplikasi mobile banking/ATM.")
	fmt.Println("2. Pilih menu Transfer -> Virtual Account.")
	fmt.Println("3. Masukkan nomor VA dan nominal.")
	fmt.Println("4. Konfirmasi pembayaran.")
}

func tampilkanTutorial(p PaymentMethod) {
	p.DisplayTutorial()
}

func main() {
	var metode PaymentMethod

	fmt.Println("Pilih metode pembayaran:")
	fmt.Println("1. QRIS")
	fmt.Println("2. E-Wallet")
	fmt.Println("3. Virtual Account")

	var pilihan int
	fmt.Print("Masukkan pilihan (1-3): ")
	fmt.Scanln(&pilihan)

	switch pilihan {
	case 1:
		metode = QRIS{}
	case 2:
		metode = EWallet{}
	case 3:
		metode = VirtualAccount{}
	default:
		fmt.Println("Metode tidak tersedia.")
		return
	}

	tampilkanTutorial(metode)
}
