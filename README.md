# terraform-azurerm-servicebus-queue-authorization-rule

TODO: insert build badge

## Create an autorization rule for a azure service bus queue

This terraform module creates a service bus queue authorization rule

> 
> ⚠️ **Note**
>
> This module uses the `azurerm_template_deployment` resource to deploy an service bus queue authorization rule which is not natively supported by Terraform.
>

## Usage

```hcl

resource "azurerm_servicebus_namespace" "servicebus" {
  name                = "test-sbns"
  location            = "westeurope"
  resource_group_name = "test-api-rg"
  sku                 = "standard"
}

resource "azurerm_servicebus_queue" "queue" {
  name                = "test-queue"
  resource_group_name = "test-api-rg"
  namespace_name      = "test-sbns"
}


module "queue_auth_policy" {
  source                   = "github.com/innovationnorway/terraform-azurerm-api-app"
  queue_list               = ["test-queue"]
  resource_group_name      = "test-api-rg"
  sb_name                  = "test-sbns"
  location                 = "westeurope"
  rule_name                = "ListenPolicy"
  claims                   = ["listen", "send", "manage"]
}

```

## Inputs

### queue_list

A list of the names of the queues on which you want to apply the policy

### resource_group_name

The name of the resource group in which to create the API App.

### sb_name

The service bus namespace name where the queues resides.

### location

Specifies the supported Azure location where the resource exists.

### rule_name

The name of the policy you want to create.

### claims

A list of the claims you want to associate with this rule, valid claims are "listen, "send" and "manage", for more information see https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-sas#rights-required-for-service-bus-operations



## Outputs

