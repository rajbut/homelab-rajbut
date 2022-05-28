locals {
  namespace = "<namespace>"
  infra_region = "ap-hyderabad-1"
  state_bucket = "<BucketNameOnOCI>"
}

remote_state {
  backend = "s3"
  config = {
    endpoint = "https://${local.namespace}.compat.objectstorage.${local.infra_region}.oraclecloud.com" # This will be always the same
    region   = local.infra_region
    bucket   = local.state_bucket
    key      = "terraform.tfstate"

    # All S3-specific validations are skipped:
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_get_ec2_platforms      = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}