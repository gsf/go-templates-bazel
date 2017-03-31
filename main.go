package main

import (
	"fmt"
	"html/template"
	"log"
	"net/http"
)

func main() {
	fmt.Println("hello")

	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":8000", nil))
}

type H struct{}

func handler(w http.ResponseWriter, req *http.Request) {
	index := template.Must(template.ParseFiles("templates/index.html"))
	h := H{}

	if err := index.ExecuteTemplate(w, "index", &h); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}
