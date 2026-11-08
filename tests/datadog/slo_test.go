package datadog

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestDatadogSloMetricAndMonitor(t *testing.T) {
	t.Parallel()

	// Configure the properties used for testing the SLO
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "./slo_terraform",
	})
	// Destroy the resources at the end of the test
	defer terraform.Destroy(t, terraformOptions)

	// Initialize and apply the resources
	terraform.InitAndApply(t, terraformOptions)

}
