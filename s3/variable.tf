variable "bucket" {
  description = "The bucket domain name Will be of format"
  type        = string
  default     = "08042022"

}
variable "acl" {
  description = "arguments are read-only  of the Terraform AWS Provider"
  type        = string
  default     = "private"
}
variable "tags" {
  type = map(any)
  default = {
    Name        = "Bucket"
    Environment = "Dev"
  }
  description = "Additional tags "
}
variable "allowed_headers" {
  type    = list(any)
  default = ["*"]
}

variable "allowed_methods" {
  type    = list(any)
  default = ["GET"]
}

variable "allowed_origins" {
  type    = list(any)
  default = ["*"]
}

variable "expose_headers" {
  type    = list(any)
  default = ["ETag"]
}

variable "max_age_seconds" {
  default = "3000"
}
variable "versioning_status" {
  description = "Enable versioning of bucket "
  default     = "Enabled"
}
variable "sse_algorithm" {
  type        = string
  default     = "AES256"
  description = "Add a key for encryption"
}

variable "target_prefix" {
  type        = string
  default     = "log/"
  description = " Prefix identifying one or more objects to which the rule applies"
}
variable "noncurrent_version" {
  type        = number
  default     = 90
  description = "The number of noncurrent versions Amazon S3 will retain"
}

variable "noncurrent_version_transition_days" {
  type        = number
  default     = 30
  description = "The number of days an object is noncurrent before Amazon S3 can perform the associated action"
}

variable "noncurrent_version_transition_storage_class" {
  type        = string
  default     = "STANDARD_IA"
  description = "The class of storage used to store the object"
}

variable "noncurrent_status" {
  type        = string
  default     = "Enabled"
  description = "Whether the rule is currently being applied"
}

variable "lifecycle_rule_id" {
  type    = string
  default = "rule-1"
}

variable "lifecycle_rule_prefix" {
  type        = string
  default     = "logs/"
  description = "Prefix identifying one or more objects to which the rule applies"
}




