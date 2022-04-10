variable "token" {
    description = "GitHub Provider OAuth Token"
    nullable = false
    type = string

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
        condition = var.organization != null && var.organization != ""
        error_message = "Cannot Specify an Empty String for the GitHub Owner (User) or Organization."
    }
}

variable "teams" {
    description = "GitHub Organizational Team(s)"
    nullable = false
    type = list(string)

    default = []
}

variable "username" {
    description = "GitHub Username Access-Management Request User"
    nullable = true
    type = string

    default = null
}