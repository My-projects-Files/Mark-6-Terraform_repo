# Secure AWS EC2 Provisioning Using Vault and Terraform

## Prerequeset
- hashicorp vault need to be installed and to lauch it locally as dev mode. we can use

        vault server -dev
- Then we need to set env variables

        export VAULT_ADDR='http://127.0.0.1:8200'
        export VAULT_TOKEN='s.XXXX' # Use the token we get from above
        export AWS_ACCESS_KEY_ID= "ASRWD..."
        export AWS_SECRET_ACCESS_KEY= "mwiwshy...."
  
