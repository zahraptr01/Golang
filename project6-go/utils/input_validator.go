package utils

import "errors"

func ValidateInput(name string, destination string) error {
	if name == "" || destination == "" {
		return errors.New("name and destination must not be empty")
	}
	return nil
}
