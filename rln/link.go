package rln

/*
#cgo LDFLAGS: -lrln -ldl -lm
#cgo darwin,386,!ios LDFLAGS:-L${SRCDIR}/../libs/i686-apple-darwin
#cgo darwin,arm64,!ios LDFLAGS:-L${SRCDIR}/../libs/aarch64-apple-darwin
#cgo darwin,amd64,!ios LDFLAGS:-L${SRCDIR}/../libs/x86_64-apple-darwin
*/
import "C"
