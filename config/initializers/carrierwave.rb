require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|

  if Rails.env.development?
    config.storage :file
  elsif Rails.env.test?
    config.storage :file
  else
    config.storage = :fog
    config.cache_storage = :fog 
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
      aws_secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
      region: 'ap-northeast-1' #例 'ap-northeast-1'
    }

    config.fog_directory  = 'freemarket-sample-0622b'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/freemarket-sample-0622b'
  end

end