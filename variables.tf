variable "compute_subnetwork_iam_bindings" {
  description = <<EOT
Map of compute_subnetwork_iam_bindings, attributes below
Required:
    - members
    - role
    - subnetwork
Optional:
    - project
    - region
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    members    = set(string)
    role       = string
    subnetwork = string
    project    = optional(string)
    region     = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

