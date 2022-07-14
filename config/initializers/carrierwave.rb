if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_public = false
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => Rails.application.credentials.aws[:default_region],
      :use_iam_profile       => true
    }
    config.fog_directory     =  Rails.application.credentials.aws[:s3_bucket]
  end
end