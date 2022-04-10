output "organization" {
    value = data.github_organization.organization
}

output "teams" {
    value = data.github_organization_teams.teams
}

output "user-block" {
    value = github_organization_block.user-access
}
