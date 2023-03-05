locals {
   repositories_with_defaults = {
    for name, value in local.repositories : 
    name => merge(local.repository_types[value.type], value)
  }
}
