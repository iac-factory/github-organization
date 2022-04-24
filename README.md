# [`github-organization`](https://github.com/iac-factory/github-organization) #

Organizational Account Configuration(s) via `terraform` - `iac-factory`

- Significant Issue: https://github.com/integrations/terraform-provider-github/issues/1123

## Overview ##

Various `github` provider configurations will share similarity; even more `terraform` packages will share configurations as it relates
to the organization's (or user preference) primary VCS system.

The following `terraform` package contains module(s) for global settings, `data` references, and overall, generally
useful `github` organization and repository-related configurations.
        
## Authentication ##

- Required: [OAuth GitHub Token](https://github.com/settings/tokens/new)

The [`github` provider](./provider.tf) authorization settings will define `token` that's passed in as user-input. Additionally, 
a variable assignment to `organization` will be required. *Please note* - the `owner` key can be assigned to a user's 
username or otherwise personal account, identifiable value as well.
               

[`provider.tf`](./provider.tf)

```terraform
provider "github" {
    token = var.token
    owner = var.organization
    
    ...
}
```

[`variables.tf`](./variables.tf)

```terraform
/// Note Issue: https://github.com/integrations/terraform-provider-github/issues/1123

variable "token" {
    description = "GitHub Provider OAuth Token"
    nullable = false
    type = string
    sensitive = true

    validation {
        condition = var.token != null && var.token != ""
        error_message = "Cannot Specify an Empty String for GitHub Authorization Token."
    }
}

variable "organization" {
    description = "GitHub Provider's Owner (User or Organization)"
    nullable = false
    type = string

    validation {
        condition = var.token != null && var.organization != ""
        error_message = "Cannot Specify an Empty String for the GitHub Owner (User) or Organization."
    }
}

...
```
