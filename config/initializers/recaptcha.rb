Recaptcha.configure do |config|
  # 現状ローカル環境のbash_profileに環境変数定義
  config.site_key = ENV["RECAPTCHA_SITE_KEY"]
  config.secret_key = ENV["RECAPTCHA_SECRET_KEY"]
  # Uncomment the following line if you are using a proxy server:
  # config.proxy = 'http://myproxy.com.au:8080'
end