package utils

import (
	"go-21/model"
	"strings"
)

func CapitalizeWords(text string) string {
	words := strings.Fields(text)
	for i, word := range words {
		words[i] = strings.Title(strings.ToLower(word))
	}
	return strings.Join(words, " ")
}

func FormatTourData(tours []model.Tour) []model.Tour {
	for i, tour := range tours {
		tours[i].Country = CapitalizeWords(tour.Country)
		tours[i].Place = CapitalizeWords(tour.Place)
	}
	return tours
}
