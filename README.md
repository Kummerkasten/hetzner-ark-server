# hetzner-ark-server
This repo provides the possibility to provison a HCloud Server which includes your SSH Key and has a public IPv4 attached. [Arkmanager](https://github.com/arkmanager/ark-server-tools) will be installed as well via userdata

## Prerequisites

1. Create an Hetzner Account
2. Create Hetzner Cloud Token
3. add prod.tfvars and insert your Hetzner Cloud Token
 ```
 hcloud_token = xxxxxxxxxxxx
 ```

## Terraform

1. init and plan
```
terraform init && terraform plan
```
2. apply
```
terraform apply
```