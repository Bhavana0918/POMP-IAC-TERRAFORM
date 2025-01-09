variable "table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "hash_key" {
  description = "The primary key (hash key) for the table"
  type        = string
}

variable "hash_key_type" {
  description = "The data type for the hash key (S, N, or B)"
  type        = string
  default     = "S"
}

variable "sort_key" {
  description = "The optional sort key for the table"
  type        = string
  default     = null
}

variable "sort_key_type" {
  description = "The data type for the sort key (S, N, or B)"
  type        = string
  default     = "S"
}

variable "billing_mode" {
  description = "The billing mode for the table (PAY_PER_REQUEST or PROVISIONED)"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "read_capacity" {
  description = "The read capacity for the table (only used if billing_mode is PROVISIONED)"
  type        = number
  default     = 5
}

variable "write_capacity" {
  description = "The write capacity for the table (only used if billing_mode is PROVISIONED)"
  type        = number
  default     = 5
}

variable "tags" {
  description = "A map of tags to assign to the table"
  type        = map(string)
  default     = {}
}
