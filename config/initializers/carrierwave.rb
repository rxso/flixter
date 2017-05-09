# config/initializers/carrierwave.rb

CarrierWave.configure do |config|
  
  config.storage    = :aws
  config.aws_bucket = ENV["AWS_BUCKET"]
  config.aws_acl    = "public-read"

  config.aws_credentials = {
      access_key_id:     ENV["AKIAIRQVMZVT32RV2PZA"],
      secret_access_key: ENV["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"],
      region:            ENV["AWS_REGION"]
  }
end