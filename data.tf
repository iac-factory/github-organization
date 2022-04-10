data "github_organization" "organization" {
    name = var.organization
}

data "github_organization_teams" "teams" {
    root_teams_only = !(var.all-teams)
}
