package test

import (
	"fmt"

	"bytes"
	"io/ioutil"
	"os"
	"testing"

	awsSDK "github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/service/dynamodb"
	"github.com/gruntwork-io/terratest/modules/aws"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

//how to test the Terraform module using Terratest.
func TestTerraformAwsInitialSetup(t *testing.T) {
	t.Parallel()

	// we change prevent_destroy variable to 'false' to test our environment
	input, err := ioutil.ReadFile("../initial-setup/s3-dynamodb.tf")
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}

	output := bytes.Replace(input, []byte("prevent_destroy = true"), []byte("prevent_destroy = false"), -1)

	if err = ioutil.WriteFile("../initial-setup/s3-dynamodb.tf", output, 0666); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}

	awsRegion := "us-east-1"

	tf_vars := map[string]interface{}{
		"region":       awsRegion,
		"project_name": "terraform-up-and-running-for-nikita-mironov",
	}

	tableName := fmt.Sprintf("%s-locks", tf_vars["project_name"])

	// Construct the terraform options with default retryable errors to handle the most common retryable errors in
	// terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../initial-setup",
		// Variables to pass to our Terraform code using -var options
		Vars: tf_vars,
	})

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Look up the DynamoDB table by name and added check

	actualTable := aws.GetDynamoDBTable(t, awsRegion, tableName)
	// it can be done by 2 ways:
	//first
	expectedTableStatus := "ACTIVE"
	actualTableStatus := awsSDK.StringValue(actualTable.TableStatus)

	assert.Equal(t, expectedTableStatus, actualTableStatus)
	fmt.Println("Table is fine !")

	expectedKeySchema := []*dynamodb.KeySchemaElement{
		{AttributeName: awsSDK.String("LockID"), KeyType: awsSDK.String("HASH")},
	}

	assert.ElementsMatch(t, expectedKeySchema, actualTable.KeySchema)
	fmt.Println("keySchema is alrigth !")

	bucketName := fmt.Sprintf("%s-state", tf_vars["project_name"])
	expectedBucketVersioning := "Enabled"
	actualBucketVersioning := aws.GetS3BucketVersioning(t, awsRegion, bucketName)

	assert.Equal(t, expectedBucketVersioning, actualBucketVersioning)
	fmt.Println("Bucket is alrigth !")
}
