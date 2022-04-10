resource "github_organization_block" "user-access" {
    count = (var.username != null) ? 1 : 0
    username = count.index
}
