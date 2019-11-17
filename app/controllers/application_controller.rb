class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?

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

  def sign_in_required
    redirect_to user_path unless user_signed_in?
  end

end
