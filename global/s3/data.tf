# data "external" "aws_account" {
#     program = [ "sh", "-c", "/usr/local/bin/aws configure get profile.demo.account_number" ]
# }