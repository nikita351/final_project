# Terraform initial-setup

# # Running automated test

1. Sign up for [AWS](https://aws.amazon.com).
2. Configure your AWS credentials using one of the [supported methods for AWS CLI tools](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html), such as setting the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables. If you're using the `~/.aws/config` file for profiles then export `AWS_SDK_LOAD_CONFIG` as "True".
3. Install [Terraform](https://www.terraform.io) and make sure it's on your `PATH`.
4. Install [GoLang](https://golang.org) and make sure this code is checked out into your `GOPATH`.
5. `cd terratest`
6. `go test -v -timeout 20m -run TestTerraformAwsInitialSetup`