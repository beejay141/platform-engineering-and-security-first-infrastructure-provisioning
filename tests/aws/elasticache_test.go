package aws

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestAwsElasticache(t *testing.T) {
	t.Parallel()

	// Configure the properties used for testing aws module
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "./elasticache_terraform",
	})

	// Destroy the resources at the end of the test
	defer terraform.Destroy(t, terraformOptions)

	// Initialize and apply the resources
	terraform.InitAndApply(t, terraformOptions)
}
