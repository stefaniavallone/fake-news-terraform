# FILES
## main.tf
The Azure resources that will be deployed
    • Resource Group  --> 
    • Storage Account -->
    
## local.tf
Define the variable for the enviromnent 

## variables.tf
Define the variables and I use it in the main.tf
    • location 
    • resource group name
    • storage account name

## providers.tf
Declaring the azurerm provider

## develop.tfvars
Define the name of the resource and for the storage

# COMMAND:
## Azure
    • az login --> authentication command
		• az login --use-device-code --> authentication if you don't have the possibility to access to the internet
		• az login -u <username> -p <password> --> authentication with username and password
	• az account set --subscription "<subscription>" --> for activate new subscription
	• az account show --output table --> list of the active subscriptions
    • az account subscription list --> get all subscriptions
    • az account subscription cancel --subscription-id "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" --> delete subscription


## Terraform
    • terraform init – The start of deploying any Terraform will begin with the initialisation stage
    • terraform plan – You can create and view a Terraform plan prior to creating any Azure resources using Terraform
        • terraform plan -var-file=develop.tfvars -lock=false
    • terraform apply – Once the plan has been reviewed, you can run the apply stage to deploy the required Azure resources
        • terraform apply -var-file=develop.tfvars -lock=false
    • terraform destroy – Not used all the time; but you can run the destroy stage to remove any Azure related resources/changes
        • terraform destroy -var-file=develop.tfvars -lock=false