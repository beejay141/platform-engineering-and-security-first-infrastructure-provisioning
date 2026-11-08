package aws

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestECSAppsModule(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "./ecs_apps_terraform",
		MaxRetries:   1,
	})

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
}
