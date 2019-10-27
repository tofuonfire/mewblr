if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => Rails.application.credentials.dig(:aws,:default_region),
      :aws_access_key_id     => Rails.application.credentials.dig(:aws,:access_key_id),
      :aws_secret_access_key => Rails.application.credentials.dig(:aws,:secret_access_key)
    }
    config.fog_directory     =  Rails.application.credentials.dig(:aws,:s3_bucket)
  end
end