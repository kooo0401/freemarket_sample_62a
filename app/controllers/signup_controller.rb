class SignupController < ApplicationController

  def new
  end

  def view1
    @user = User.new
  end

  def view2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    params[:birthday] = birthday_join
    session[:birthday] = params[:birthday] 
    @user = User.new
  end

  def view3
    session[:tel] = user_params[:tel]
    @user = User.new
  end

  def view4
    @user = User.new
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
    redirect_to root_path
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      tel: session[:tel],
      birthday: session[:birthday],
    )
    if @user.save
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      render '/signup/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :password_confirmation, 
      :last_name, 
      :first_name, 
      :last_name_kana, 
      :first_name_kana, 
      :tel,
      :birthday,
    )
  end

  # def birthday_params
  #   params.require(:birthday).permit(:birthday)
  # end

  def birthday_join
    date = params[:birthday]

    if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
      return
    end
    
    Date.new date["birthday(1i)"].to_i, date["birthday(2i)"].to_i, date["birthday(3i)"].to_i
  end

end
