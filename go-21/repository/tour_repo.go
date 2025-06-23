package repository

import (
	"database/sql"
	"go-21/model"
)

type TourRepository interface {
	FindAll() ([]model.Tour, error)
}

type tourRepository struct {
	db *sql.DB
}

func NewTourRepository(db *sql.DB) TourRepository {
	return &tourRepository{db: db}
}

func (r *tourRepository) FindAll() ([]model.Tour, error) {
	rows, err := r.db.Query("SELECT * FROM tours")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var tours []model.Tour
	for rows.Next() {
		var t model.Tour
		err := rows.Scan(
			&t.ID,
			&t.Country,
			&t.Place,
			&t.Description,
			&t.Price,
			&t.TourDuration,
			&t.Rating,
			&t.Image,
			&t.People,
			&t.FlagImage,
			&t.PriceDiscount,
		)
		if err != nil {
			return nil, err
		}
		tours = append(tours, t)
	}

	return tours, nil
}
