class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  ## 以下、ログイン機能設計次第で要不要判断
  # before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    # 以下、ログイン機能設計次第で要不要判断
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nickname, :name_kana, :birthday, :tel])
    # 登録情報入力ページが複数あるため、”追加したいメソッド名がsign_upのママで良いかは要確認
  end

end
