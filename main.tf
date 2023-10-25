provider "azurerm" {
  features {}
}

resource "azurerm_template_deployment" "example" {
  name                = "example-deployment"
  resource_group_name = "example-resources"
  deployment_mode     = "Incremental"

  template_body = file("${path.module}/template.json")
  parameters_content = file("${path.module}/parameters.json")
}
