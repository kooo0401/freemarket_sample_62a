require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test? #開発とテスト環境は今まで通り(デプロイ担当以外が保存できなくなる為)
    config.storage = :file
  elsif Rails.env.production? #本番環境ではS3に保存
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS', #AWSのアクセスキーとシークレットキーを環境変数で定義する
      aws_access_key_id: Rails.application.credentials.aws[:access_key_id], #credentails.ymlに鍵の本体があります
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key], #credentails.ymlに鍵の本体があります
      region: 'ap-northeast-1'
    }
    config.fog_directory  = 'mercari-62a'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/mercari-62a'
  end
end