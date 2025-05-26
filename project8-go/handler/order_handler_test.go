package handler

import (
	"encoding/json"
	"os"
	"path/filepath"
	"project8-go/dto"
	"testing"
)

// helper untuk simpan data ke file JSON
func saveTestData(filename string, data []dto.Order) error {
	bytes, err := json.MarshalIndent(data, "", "    ")
	if err != nil {
		return err
	}
	return os.WriteFile(filename, bytes, 0644)
}

// helper untuk baca data dari file JSON
func readTestData(filename string) ([]dto.Order, error) {
	bytes, err := os.ReadFile(filename)
	if err != nil {
		return nil, err
	}
	var orders []dto.Order
	err = json.Unmarshal(bytes, &orders)
	return orders, err
}

// TestSaveOrderWithTempFile menguji SaveOrder tapi dengan file sementara
func TestSaveOrderWithTempFile(t *testing.T) {
	// Buat folder sementara di system temp directory
	tmpDir := os.TempDir()
	testFile := filepath.Join(tmpDir, "test_orders.json")

	// Data awal (misal 2 order)
	initialData := []dto.Order{
		{ID: "order-1", Name: "Alice", Destination: "Jakarta", Price: 10000},
		{ID: "order-2", Name: "Bob", Destination: "Bandung", Price: 20000},
	}

	// Simpan data awal ke file sementara
	if err := saveTestData(testFile, initialData); err != nil {
		t.Fatalf("Gagal simpan data awal: %v", err)
	}

	err := SaveOrderFromFile(testFile, dto.Order{
		ID:          "order-3",
		Name:        "Charlie",
		Destination: "Surabaya",
		Price:       30000,
	})

	if err != nil {
		t.Errorf("SaveOrderFromFile gagal: %v", err)
	}

	// Baca file dan cek data
	orders, err := readTestData(testFile)
	if err != nil {
		t.Fatalf("Gagal baca file test: %v", err)
	}

	// Harus ada 3 data sekarang
	if len(orders) != 3 {
		t.Errorf("Expected 3 orders, got %d", len(orders))
	}

	found := false
	for _, o := range orders {
		if o.ID == "order-3" && o.Name == "Charlie" {
			found = true
			break
		}
	}
	if !found {
		t.Errorf("Order baru tidak ditemukan")
	}

	// Hapus file sementara setelah test
	os.Remove(testFile)
}

// Versi baru SaveOrder yang menerima nama file untuk test
func SaveOrderFromFile(filename string, order dto.Order) error {
	data, err := os.ReadFile(filename)
	if err != nil {
		return err
	}
	var orders []dto.Order
	if err := json.Unmarshal(data, &orders); err != nil {
		return err
	}

	orders = append(orders, order)

	formattedData, err := json.MarshalIndent(orders, "", "    ")
	if err != nil {
		return err
	}

	return os.WriteFile(filename, formattedData, 0644)
}
