variable "keypair" {
    type                    = "string"
    description             = "SSH keypair to use to connect to instances"
    default                 = "itx_rsa"
}

variable "flavor" {
    type                    = "string"
    description             = "AWS type to use when creating instances"
    default                 = "t2.micro"
}

variable "user_region" {
    type                    = "string"
    description             = "AWS region to use by default"
    default                 = "us-west-2"
}
