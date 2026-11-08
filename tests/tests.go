package tests

import (
	"os"
	"testing"
)

func SkipCI(t *testing.T) {
	if os.Getenv("CI") == "true" {
		t.Skip("Skipping testing in CI environment")
	}
}
