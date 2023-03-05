# github-repositories

##  Example 

```terraform

module "github_repository" {
    source  = "dasmeta/repository/github//modules/github-repository"
    version = "v0.6.0"
    for_each = local.repositories_with_defaults

    name        = each.key
    description            = "Created with terraform"
    visibility             = each.value.visibility
    create_repository = false
    has_issues = true 
    has_projects = true
    has_wiki = true
    auto_init = true
    delete_branch_on_merge = false
    branches = ["best-practices", "main"]
    default_branch         = "main"
    gitignore_template     = "Terraform"
    allow_auto_merge       = false
    allow_rebase_merge     = true
    archive_on_destroy = false
    branch_toPush = "best-practices"
    pre_commit =  true 
    semantic_release =  true 
    checkov = true
    infracost = true
    terraform-test = true
    tflint = true
    tfsec = true
    commit_message = "chore(add): Inital Commit"
    branch_protections = [
    {
        branch                 = "main"
        enforce_admins         = true
        require_signed_commits = true

        required_pull_request_reviews = {
        dismiss_stale_reviews           = true
        require_code_owner_reviews      = true
        required_approving_review_count = 1
        }
    }
    ]

    branch_protections_v3 = [
    {
        branch                 = "main"
        enforce_admins         = true
        require_signed_commits = true

        required_pull_request_reviews = {
        dismiss_stale_reviews           = true
        require_code_owner_reviews      = true
        required_approving_review_count = 1
        }
    }
    ]

}

```

## Provider block 

```hcl
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "github" {
  owner = "dasmeta"
  token = "your_token"
}

```