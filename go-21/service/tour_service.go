package service

import (
	"go-21/model"
	"go-21/repository"
)

type TourService interface {
	GetAllTours() ([]model.Tour, error)
}

type tourService struct {
	repo repository.TourRepository
}

func NewTourService(repo repository.TourRepository) TourService {
	return &tourService{repo: repo}
}

func (s *tourService) GetAllTours() ([]model.Tour, error) {
	return s.repo.FindAll()
}
