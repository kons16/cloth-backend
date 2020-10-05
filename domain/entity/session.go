package entity

import "time"

type Session struct {
	ID			int64
	UserID 		int64
	Token		string
	ExpiresAt	time.Time
}
