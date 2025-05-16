package main

import (
	"fmt"
)

// func main() {
// 	// // Data Array
// 	// arr := [4]int{}
// 	// arr[3] = 2
// 	// fmt.Println("Data Array : ", arr)

// 	// // Data Slice
// 	// slice := []int{1, 2, 3, 4, 5} // lima data
// 	// fmt.Println("Data Slice")
// 	// fmt.Println("data pertama : ", slice)
// 	// slice = append(slice, 6) // copy array sebelumnya
// 	// fmt.Println("data kedua : ", slice)
// 	// fmt.Println("len : ", len(slice))
// 	// fmt.Println("cap : ", cap(slice))

// 	// // Copy Slice
// 	// slice2 := make([]int, 4)
// 	// copy(slice2, slice)
// 	// fmt.Println("data slice 2 : ", slice2)
// 	// fmt.Println("len : ", len(slice2))
// 	// fmt.Println("cap : ", cap(slice2))

// 	// // for range
// 	// slice := []string{"Hallo", "lumoshive", "academy"}

// 	// for index, str := range slice {
// 	// 	fmt.Println("data : ", str, "index : ", index)
// 	// }

// 	// // for statement
// 	// counter := 0
// 	// for counter < 5 {
// 	// 	fmt.Println("Counter : ", counter)
// 	// 	counter++
// 	// }

// 	// // break
// 	// counter := 0
// 	// for counter < 10 {
// 	// 	fmt.Println("Counter:", counter)

// 	// 	if counter == 5 {
// 	// 		fmt.Println("Break saat counter == 5")
// 	// 		break
// 	// 	}

// 	// 	counter++
// 	// }

// 	// contiue
// 	// slice := []int{1, 2, 3, 4, 5, 6, 7}

// 	// for , num := range slice {
// 	// 	if num == 3 {
// 	// 		continue
// 	// 	}

// 	// 	fmt.Println("Cetak data : ",)
// 	// }

// 	// // Data slice
// 	// data := []int{5, 6, 7, 9, 15, 10, 3, 5, 6, 7, 8, 4, 8, 2, 1, 4, 9, 15, 27, 10, 1}

// 	// // Ambil elemen dari index 6 sampai 18
// 	// result := data[6:19]

// 	// // Tampilkan hasil
// 	// fmt.Println("Tampilan nilai dari index 6 sampai 18", result)

// 	// data := []int{5, 6, 7, 9, 15, 10, 3, 5, 6, 7, 8, 4, 8, 2, 1, 4, 9, 15, 27, 10, 1}

// 	// index := data[5]
// 	// index2 := data[6]
// 	// index3 := data[8]
// 	// index4 := data[10]
// 	// index5 := data[15]

// 	// rerata := (index + index2 + index3 + index4 + index5) / 5

// 	// fmt.Println("Nilai rata - rata = ", rerata)

// 	for i := 1; i <= 100; i++ {
// 		if i == 50 {
// 			break
// 		}
// 		if i%5 == 0 {
// 			continue
// 		}
// 		fmt.Println(i)
// 	}
// }

// func hitungDiskon(jumlahBarang int, hargaPerBarang float64) float64 {
// 	var diskon float64

// 	switch {
// 	case jumlahBarang >= 5:
// 		diskon = 0.75
// 	case jumlahBarang == 4:
// 		diskon = 0.50
// 	case jumlahBarang == 2:
// 		diskon = 0.10
// 	default:
// 		diskon = 0.0
// 	}

// 	total := float64(jumlahBarang) * hargaPerBarang
// 	totalSetelahDiskon := total * (1 - diskon)
// 	return totalSetelahDiskon
// }

// func main() {
// 	jumlah := 5
// 	harga := 100000.0 // harga per barang

// 	totalBayar := hitungDiskon(jumlah, harga)
// 	fmt.Printf("Total bayar untuk %d barang adalah Rp%.0f\n", jumlah, totalBayar)
// }

// Fungsi untuk menghitung total ganjil dan genap
func hitungGanjilGenap(angka *[]int) (int, int) {
	totalGanjil := 0
	totalGenap := 0

	for _, val := range *angka {
		if val%2 == 0 {
			totalGenap += val
		} else {
			totalGanjil += val
		}
	}

	return totalGanjil, totalGenap
}

func main() {
	// Slice angka
	angka := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}

	// Panggil fungsi dan cetak hasilnya
	totalGanjil, totalGenap := hitungGanjilGenap(&angka)

	fmt.Println("Total bilangan ganjil:", totalGanjil)
	fmt.Println("Total bilangan genap:", totalGenap)
}
