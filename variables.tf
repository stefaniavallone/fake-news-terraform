variable "location" {
  type        = string
  default     = "West Europe"
  description = "default resources location"
}
 
variable "fake_news_resource_group_name" {
  type        = string
  description = "resource group name"
}
 
variable "fake_news_storage_name" {
  type        = string
  description = "storage account name"
}

variable "fake_news_virtual_machine_name" {
  type        = string
  description = "virtual machine name"
}

variable "fake_news_subnet_name" {
  type        = string
  description = "subnet name"
}

variable "fake_news_network_name" {
  type        = string
  description = "network name"
}

variable "fake_news_network_interface_name" {
  type        = string
  description = "network interface name"
}

variable "fake_news_virtual_machine_storage_os_disk1_name" {
  type        = string
  description = "name of the storage disk"
}

variable "fake_news_virtual_machine_os_profile_name" {
  type        = string
  description = "name of the os profile"
}

variable "fake_news_key_vault_name" {
  type        = string
  description = "name of the key vault"
}

variable "fake_news_insights_name" {
  type        = string
  description = "name of the insights"
}

variable "fake_news_machine_learning_name" {
  type        = string
  description = "name of the machine learning"
}

variable "fake_news_machine_learning_compute_instance_name" {
  type        = string
  description = "name of the compute instance for machine learning"
}

variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCqaZoyiz1qbdOQ8xEf6uEu1cCwYowo5FHtsBhqLoDnnp7KUTEBN+L2NxRIfQ781rxV6Iq5jSav6b2Q8z5KiseOlvKA/RF2wqU0UPYqQviQhLmW6THTpmrv/YkUCuzxDpsH7DUDhZcwySLKVVe0Qm3+5N2Ta6UYH3lsDf9R9wTP2K/+vAnflKebuypNlmocIvakFWoZda18FOmsOoIVXQ8HWFNCuw9ZCunMSN62QGamCe3dL5cXlkgHYv7ekJE15IA9aOJcM7e90oeTqo+7HTcWfdu0qQqPWY5ujyMw/llas8tsXY85LFqRnr3gJ02bAscjc477+X+j/gkpFoN1QEmt terraform@demo.tld"
}