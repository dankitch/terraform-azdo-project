resource "azuredevops_project" "main" {
  name        = var.project_name
  description = "Welcome to the ${var.project_name} project!"
}


resource "azuredevops_git_repository" "infra_repo" {
  project_id = azuredevops_project.main.id
  name       = "infrastructure"

  initialization {
    init_type   = "Import"
    source_type = "Git"
    source_url  = "https://github.com/markti/azdo-terraform-template-multi-stage.git"
  }

}
