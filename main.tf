resource "google_compute_subnetwork_iam_binding" "compute_subnetwork_iam_bindings" {
  for_each = var.compute_subnetwork_iam_bindings

  members    = each.value.members
  role       = each.value.role
  subnetwork = each.value.subnetwork
  project    = each.value.project
  region     = each.value.region

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

