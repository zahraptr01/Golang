package main

import "fmt"

// Define Student struct
type Student struct {
	Name     string
	Exercise float64
	Homework float64
	Exam     float64
	Final    float64
	Grade    string
}

// Function to calculate the final score
func calculateFinal(exercise, homework, exam float64) float64 {
	return (exercise * 0.2) + (homework * 0.3) + (exam * 0.5)
}

// Function to determine grade based on final score
func assignGrade(score float64) string {
	switch {
	case score >= 85:
		return "A"
	case score >= 75:
		return "B"
	case score >= 65:
		return "C"
	case score >= 50:
		return "D"
	default:
		return "E"
	}
}

func main() {
	// Data Student
	students := []Student{
		{"Andi", 80, 85, 75, 0, ""},
		{"Sinta", 90, 88, 92, 0, ""},
		{"Budi", 65, 70, 60, 0, ""},
		{"Lina", 50, 60, 55, 0, ""},
	}

	// Calculate the final score and grade
	for i := range students {
		finalScore := calculateFinal(students[i].Exercise, students[i].Homework, students[i].Exam)
		students[i].Final = finalScore
		students[i].Grade = assignGrade(finalScore)
	}

	// Show Result
	subject := "Matematika"
	fmt.Printf("Report for Subject: %s\n", subject)
	fmt.Printf("---------------------------------------------------------------\n")
	fmt.Printf("%-12s %-9s %-9s %-6s %-12s %-5s\n", "Student Name", "Exercise", "Homework", "Exam", "Final Score", "Grade")
	fmt.Printf("---------------------------------------------------------------\n")

	for _, s := range students {
		fmt.Printf("%-12s %-9.2f %-9.2f %-6.2f %-12.2f %-5s\n",
			s.Name, s.Exercise, s.Homework, s.Exam, s.Final, s.Grade)
	}
}
