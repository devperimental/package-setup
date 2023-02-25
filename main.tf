# This file decodes the yaml file and makes it into a terraform map than can then be used with for_each statements
locals {
  repo_list = yamldecode(file("${path.root}/conf/${var.config_file}"))["repo_list"] 
}

resource "github_repository" "template-repo" {
  for_each = {
    for repo in local.repo_list : repo.name => repo
    if repo.template != null
  }

  name        = each.value.name
  description = each.value.description
  visibility  = each.value.visibility
  template {
    owner      = each.value.owner
    repository = each.value.template
  }
  has_issues = true
}

resource "github_branch_protection" "template-repo" {
  for_each = {
    for repo in local.repo_list : repo.name => repo
    if repo.template != null
  }

  repository_id = github_repository.template-repo[each.key].node_id
  pattern          = "main"
  enforce_admins   = true
  allows_deletions = true

  required_pull_request_reviews {
    dismiss_stale_reviews  = true
    required_approving_review_count = 0
    restrict_dismissals    = true
  }
}

# Add a collaborator to a repository
resource "github_repository_collaborator" "a_repo_collaborator" {

  for_each = {
    for repo in local.repo_list : repo.name => repo
    if repo.template != null
  }

  repository = each.value.name
  username   = "chrisxpr"
  permission = "admin"
}

resource "github_actions_secret" "repo_secret" {
 
  for_each = {
    for repo in local.repo_list : repo.name => repo
    if repo.template != null
  }

  repository = each.value.name
  secret_name      = "NUGET_PAT"
  plaintext_value  = var.nuget_pat
}