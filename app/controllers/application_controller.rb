class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  ## 以下、ログイン機能設計次第で要不要判断
  # before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource) #ログイン後に遷移したいページを指定
    root_path
  end

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
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nickname, :name_kana, :birthday, :te])
    # 登録情報入力ページが複数あるため、”追加したいメソッド名がsign_upのママで良いかは要確認
  end

  def sign_in_required
    redirect_to user_path unless user_signed_in?
  end

end
