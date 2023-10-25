provider "azurerm" {
  features {}
}

resource "azurerm_resource_group_template_deployment" "example" {
  name                = "centroEdge-deployment"
  resource_group_name = "rg-centro-admin-spoke-test-001"
  deployment_mode     = "Incremental"

  template_content =  file("${path.module}/template.json")
  parameters_content = file("${path.module}/parameters.json")
}
