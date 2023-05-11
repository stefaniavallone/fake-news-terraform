# Introduction 
The project utilizes Terraform to create and manage the infrastructure of an application on Azure. Terraform is an infrastructure provisioning tool as code, which means it is used to define and manage cloud resources as if they were part of the application code itself. This allows for more efficient and scalable infrastructure management and simplifies deployment and management operations.

In this project, using Terraform, various resources are created on Azure, such as virtual machines, networks, storage, and cloud services. These resources are then configured and integrated to provide a complete infrastructure for the application.

The project also uses configuration files to define infrastructure variables and parameters, making it flexible and scalable. This allows for quick and easy modification of the infrastructure based on the needs of the application and business.

Finally, the project also utilizes deployment and destruction actions of the infrastructure to simplify and automate the infrastructure management process. This allows for quick and easy deployment of the application and destruction of the infrastructure when it is no longer needed.

## Table of contents
   * [Configurations](#configurations)
   * [Commands](#commands)
      * [Azure](#azure)
      * [Terraform](#terraform)
    
# Configurations
## main.tf
The Azure resources that will be deployed
* <b>Resource Group:</b> An Azure resource group provides a logical container where Azure services are stored and managed. This project creates a new resource group named "fake_news_resource_group".
* <b>Application Insights:</b> Application Insights is an Azure telemetry platform that allows monitoring and diagnosing application performance. This project creates a new Application Insights component named "fake_news_insights". 
* <b>Key Vault:</b> Key Vault is an Azure service that allows securely storing and managing keys, passwords, and other secrets. This project creates a new Key Vault component named "fake_news_key_vault".
* <b>Storage Account:</b> An Azure storage account offers scalable and secure storage space for unstructured data. This project creates a new storage account named "fake_news_storage".
* <b>Machine Learning Workspace:</b> An Azure Machine Learning workspace is a fully managed development environment where you can create, manage, and deploy machine learning models. This project creates a new Machine Learning workspace named "fake_news_machine_learning".
* <b>Virtual Network:</b> An Azure Virtual Network is an isolated networking service that allows creating private networks in Azure. This project creates a new virtual network named "fake_news_network".
* <b>Subnet:</b> A subnet is a subdivision of an Azure Virtual Network. This project creates a new subnet named "fake_news_subnet".
* <b>Machine Learning Compute Instance:</b> A Machine Learning Compute instance is an Azure virtual machine that allows running training and inference of machine learning models. This project creates a new Machine Learning Compute instance named "fake_news_machine_learning_compute_instance".
    

## develop.tfvars
This file contains the input variables required to deploy the infrastructure for the "Fake News" project. The variables specified in this file will be used to configure the resources deployed in Azure.
The following variables can be configured:
* <b>fake_news_resource_group_name:</b> The name of the resource group that will be created to contain the project resources.
*  <b>fake_news_storage_name:</b> The name of the storage account that will be created to store the project data. 
*  <b>fake_news_virtual_machine_name:</b> The name of the virtual machine that will be created to host the project application. 
*  <b>fake_news_subnet_name:</b> The name of the subnet that will be created to host the virtual machine. 
* <b>fake_news_network_name:</b> The name of the virtual network that will be created to contain the project resources. 
*  <b>fake_news_network_interface_name:</b> The name of the network interface that will be created for the virtual machine. 
*  <b>fake_news_virtual_machine_storage_os_disk1_name:</b> The name of the OS disk that will be created for the virtual machine. 
*  <b>fake_news_virtual_machine_os_profile_name:</b> The name of the OS profile that will be created for the virtual machine. 
* <b>fake_news_key_vault_name:</b> The name of the key vault that will be created to store and manage cryptographic keys. 
*  <b>fake_news_insights_name:</b> The name of the Application Insights instance that will be created to monitor the application. 
*  <b>fake_news_machine_learning_name:</b> The name of the Machine Learning workspace that will be created to train and deploy machine learning models. 
*  <b>fake_news_machine_learning_compute_instance_name:</b> The name of the compute instance that will be created for Machine Learning workloads. 

Note that the values specified in this file will override any default values specified in the variables.tf file.

## Variable configurations
| Name        | Type   | Description     |   Default
| ------------|:-------------:| -----:| ------------|
| location    | string  | Default resources location | "West Europe"
| fake_news_resource_group_name    | string      | Name of the resource group |
| fake_news_storage_name| string      | Name of the storage account |
| fake_news_virtual_machine_name| string      | Name of the virtual machine |
| fake_news_subnet_name| string      | Name of the subnet |
| fake_news_network_name| string      | Name of the network |
| fake_news_network_interface_name| string      | Name of the network interface |
| fake_news_virtual_machine_storage_os_disk1_name| string      | Name of the storage disk |
| fake_news_virtual_machine_os_profile_name| string      | Name of the OS profile |
| fake_news_key_vault_name| string      | Name of the key vault |
| fake_news_insights_name| string      | Name of the insights |
| fake_news_machine_learning_name| string      | Name of the machine learning |
| fake_news_machine_learning_compute_instance_name| string      | Name of the compute instance for machine learning |
| ssh_key| string      | SSH public key to access the virtual machine | 

## Provider Configuration
The provider block in this configuration sets up the AzureRM provider with version 3.46.0. It also includes an empty features block, which is required for AzureRM provider 2.x. If you are using version 1.x, the features block is not allowed. This provider allows Terraform to interact with Azure services to manage resources in an Azure environment. You'll need to configure authentication credentials in order to use this provider. For more information on configuring the AzureRM provider, please refer to the official Terraform documentation.

# Commands:
## Azure
* <b>az login:</b> This command is used to log in to your Azure account. Once executed, it will prompt you to enter your account credentials. By default, it will open a web page where you can enter your credentials. If you don't have access to the web, you can use the --use-device-code option to complete the authentication process from another device. Alternatively, you can use the -u and -p options to provide your username and password directly on the command line.

* <b>az account set --subscription "<subscription>":</b> This command is used to set the active subscription for your Azure account. You need to replace <subscription> with the name or ID of the subscription that you want to activate.

* <b>az account show --output table:</b> This command is used to display information about the active subscription. The output will be formatted as a table.

* <b>az account subscription list:</b> This command is used to retrieve a list of all the subscriptions associated with your Azure account. The output will include the subscription ID, name, and state.

* <b>az account subscription cancel --subscription-id "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx":</b> This command is used to cancel a subscription. You need to replace xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx with the ID of the subscription that you want to cancel. Note that this action cannot be undone and any resources associated with the subscription will be permanently deleted.

## Terraform
Sure, here's the documentation for the Terraform commands:

* <b>terraform init:</b> This command initializes a working directory containing Terraform configuration files. It downloads the required provider plugins and sets up the backend for storing the Terraform state.

* <b>terraform plan:</b> This command creates an execution plan for the changes that Terraform will make to the infrastructure. It helps you identify any potential issues before making changes to the infrastructure.
    * <b>terraform plan -var-file=develop.tfvars -lock=false:</b> This command creates a plan using the variables defined in the develop.tfvars file and disables locking of the state file.

* <b>terraform apply:</b> This command applies the changes necessary to achieve the desired state of the infrastructure. It creates, modifies, or deletes resources as necessary.
    * <b>terraform apply -var-file=develop.tfvars -lock=false:</b> This command applies the changes using the variables defined in the develop.tfvars file and disables locking of the state file.

* <b>terraform destroy:</b> This command destroys the Terraform-managed infrastructure. It removes all resources that were created by Terraform. 
    * <b>terraform destroy -var-file=develop.tfvars -lock=false:</b> This command destroys the resources using the variables defined in the develop.tfvars file and disables locking of the state file.