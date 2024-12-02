variable "project_name" {
  type        = string
  description = "Name of the project."

}

variable "application_name" {
  type        = string
  description = "Name of the application."

}

variable "environments" {
  type        = list(string)
  description = "Name of the environment."
}

variable "azure_credentials" {
  type = map(
    object({
      client_id       = string
      client_secret   = string
      tenant_id       = string
      subscription_id = string
    })
  )
  description = "Azure credentials."
}

variable "azure_backends" {
  type = map(
    object({
      resource_group  = string
      storage_account = string
      container       = string
    })
  )
  description = "Azure backend."
}

variable "repository_template_url" {
  type        = string
  description = "URL of the repository template to import."
}

variable "default_reviewers" {
  type        = list(string)
  description = "Default reviewers for the pull request."
}

variable "minimum_number_of_reviewers" {
  type        = number
  description = "Minimum number of reviewers."
}
