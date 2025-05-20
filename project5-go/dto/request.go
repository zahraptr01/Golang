package dto

import "errors" // Import the errors package

// Request struct definition
type Request struct {
	Name        string
	Destination string
}

// NewRequest constructor function
func NewRequest(name string, destination string) Request {
	return Request{
		Name:        name,
		Destination: destination,
	}
}

// Validate method for Request
func (r *Request) Validate() error {
	if r.Name == "" {
		return errors.New("nama tidak boleh kosong")
	}
	if r.Destination == "" {
		return errors.New("tujuan tidak boleh kosong")
	}
	return nil
}
