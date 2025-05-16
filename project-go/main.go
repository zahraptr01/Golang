package main

// // Challenge 1
// import "fmt"

// func main() {
// 	// Kalimat yang akan dikonversi
// 	kalimat := "Aku seorang programmer golang yang handal"

// 	// Mengonversi kalimat menjadi slice byte
// 	reprByte := []byte(kalimat)

// 	// Mencetak kalimat awal dan slice byte
// 	fmt.Println(kalimat)
// 	fmt.Println(reprByte)
// }

// // Challenge 2
// import "fmt"

// func main() {
// 	// var A float64 = 30
// 	// var B float64 = 24.5
// 	// var C float64 = -45
// 	// var D float64 = 0.67

// 	// Operasi matematika sesuai rumus
// 	// E := (A + B) * C / D

// 	var A int = 30
// 	var B float64 = 24.5
// 	var C int = -45
// 	var D float64 = 0.67

// 	// Operasi matematika sesuai rumus
// 	E := (float64(A) + B) * float64(C) / D

// 	// Tampilkan hasil
// 	fmt.Printf("nilai dari variabel E adalah %.6f\n", E)
// }

// Challenge 3
import "fmt"

func main() {
	// Deklarasi variabel
	hargaJual := 150000.00
	hargaBeli := 100000.00
	biayaOperasional := 1000.00
	jumlahProduk := 100
	diskon := 0.15

	// Harga jual setelah diskon
	hargaJualSetelahDiskon := hargaJual * (1 - diskon)

	// Total pendapatan
	totalPendapatan := hargaJualSetelahDiskon * float64(jumlahProduk)

	// Total biaya = (harga beli + biaya operasional) * jumlah produk
	totalBiaya := (hargaBeli + biayaOperasional) * float64(jumlahProduk)

	// Total keuntungan
	totalKeuntungan := totalPendapatan - totalBiaya

	// Tampilkan hasil
	fmt.Printf("Harga Jual Setelah Diskon: Rp %.2f\n", hargaJualSetelahDiskon)
	fmt.Printf("Total Pendapatan: Rp %.2f\n", totalPendapatan)
	fmt.Printf("Total Biaya: Rp %.2f\n", totalBiaya)
	fmt.Printf("Total Keuntungan: Rp %.2f\n", totalKeuntungan)
}

// type CustomerString = string // alias
// type UserID int              // declaration

// func main() {
// 	var name CustomerString = "academy"
// 	var second_name string = name
// 	println(second_name)

// 	var id UserID = 435
// 	var user_id int = int(id)
// 	println(user_id)
// }

// const (
// 	Read = 1 << iota // hasilnya kelipatan 2 atau 2 pangkat
// 	// Read = iota + 1 // hasilnya berurut 1 2 3 4
// 	Write
// 	Delete
// 	Execute
// )

// func main() {
// 	println(Read)
// 	println(Write)
// 	println(Delete)
// 	println(Execute)
// }

// import "fmt"

// func main()  {
// 	fmt.Println("Hello World !")
// }

// var num int
// var name string
// var status bool
// var total float64

// func main() {
// 	println(num)
// 	println(name)
// 	println(status)
// 	println(total)
// }
