resource "azuredevops_build_definition" "apply" {
  count      = length(var.environments)
  project_id = azuredevops_project.main.id
  name       = "apply-${var.environments[count.index]}"
  path       = "\\${var.application_name}\\${var.environments[count.index]}"

  ci_trigger {
    use_yaml = false
  }

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.infra_repo.id
    branch_name = azuredevops_git_repository.infra_repo.default_branch
    yml_path    = ".azdo-pipelines/terraform-multi-stage.yaml"
  }

  variable_groups = [
    azuredevops_variable_group.azure_credentials[count.index].id,
    azuredevops_variable_group.azure_backends[count.index].id
  ]

  variable {
    name  = "ApplicationName"
    value = var.application_name
  }

  variable {
    name  = "EnvironmentName"
    value = var.environments[count.index]
  }

  variable {
    name  = "WorkingDirectory"
    value = "src/terraform"
  }

}
