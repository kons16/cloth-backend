package entity

type Clothe struct {
	ID       int
	Name     string
	Price    string
	ImageUrl string
	User     *User
}
