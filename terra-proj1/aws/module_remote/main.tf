module "statelock" {
  source              = "../../../modules/state_lock"
  bucket_name         = "my-terraform-state-bucket"
  lock_table_name     = "terraform-locks"
}

