#require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage    = :aws
    config.aws_bucket = Rails.application.credentials.dig(:aws, :s3_bucket_name)
    #config.aws_bucket = ENV.fetch('S3_BUCKET_NAME') # for AWS-side bucket access permissions config, see section below
    config.aws_acl    = 'public-read'

    config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

    config.aws_credentials = {
      access_key_id: "#{Rails.application.credentials.dig(:aws, :access_key_id)}"
      secret_access_key: "#{Rails.application.credentials.dig(:aws, :secret_access_key)}"
      region: "#{Rails.application.credentials.dig(:aws, :region)}"
      
      #access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
    #secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
    #region:            ENV.fetch('AWS_REGION'), # Required
    #stub_responses:    Rails.env.test? # Optional, avoid hitting S3 actual during tests
  }   
  end
end
