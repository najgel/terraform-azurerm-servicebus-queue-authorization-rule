# terraform-azurerm-api-app

TODO: insert build badge

## Create an API App in Azure

This terraform module deploys an API App in Azure.

> 
> ⚠️ **Note**
>
> This module uses the `azurerm_template_deployment` resource to deploy an API App which is not natively supported by Terraform.
>

## Usage

```hcl

module "app_service_plan" {
  source                   = "github.com/innovationnorway/terraform-azurerm-app-service-plan"
  app_service_plan_name    = "test-api-plan"
  resource_group_name      = "test-api-rg"
  location                 = "westeurope"
}

module "api_app" {
  source                   = "github.com/innovationnorway/terraform-azurerm-api-app"
  api_app_name             = "test-api"
  app_service_plan_id      = "${module.app_service_plan.app_service_plan_id}"
  resource_group_name      = "test-api-rg"
  location                 = "westeurope"
}

```

## Inputs

### api_app_name

Specifies the name of the API App.

### resource_group_name

The name of the resource group in which to create the API App.

### location

Specifies the supported Azure location where the resource exists.

### app_service_plan_id

The ID of the App Service Plan within which to create this API App.

### api_definition_url

The URL of the API definition.

### cors_allowed_origins

Gets or sets the list of origins that should be allowed to make cross-origincalls (for example: http://example.com:12345). Use `*` to allow all.

### MSI

If set to 'yes' MSI is enabled on the API app.

### tags

A mapping of tags to assign to the resource.

## Outputs

### api_app_id

The API App ID.

### api_app_name

The API App name.

### default_site_hostname

The default hostname associated with the API App, such as `mysite.azurewebsites.net`.