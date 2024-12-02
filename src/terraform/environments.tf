resource "azuredevops_environment" "main" {
  project_id = azuredevops_project.main.id
  count      = length(var.environments)
  name       = "${var.application_name}-${var.environments[count.index]}"


}
