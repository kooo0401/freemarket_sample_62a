class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user
  
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @myaddress = Myaddress.includes(:user).find_by(user_id: @user.id)

    # ストロングパラメータが片方nilだった場合、エラーを発生させるので、回避（requireメソッドの特徴）堀
    if params[:myaddress] == nil
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        redirect_to　root_path
      end
    else params[:user] == nil
      if @myaddress.update(myaddress_params)
        redirect_to user_path(@user)
      else
        redirect_to root_path
      end
    end

  end

  def logout_page
    @user = User.find(params[:id])
  end

  def profile_edit
    @user = User.find(params[:id])
  end

  def credit_add
    @user = User.find(params[:id])
  end

  def credit_edit
    @user = User.find(params[:id])
  end

  def confirmation_edit
    @user = User.find(params[:id])
  end

  def myaddress_edit
    @user = User.find(params[:id])
    @myaddress = Myaddress.includes(:user).find_by(user_id: @user.id)
  end

  def mail_pass_edit
    @user = User.find(params[:id])
  end

  def tel_edit
    @user = User.find(params[:id])
  end

  def myproducts_list_exhibiting
    @user = User.find(params[:id])
  end

  def myproducts_list_trading
    @user = User.find(params[:id])
  end

  def myproducts_list_sold
    @user = User.find(params[:id])
  end


  # ログイン中ユーザーでなければ、他ユーザーのマイページは見れない
  def ensure_correct_user

    if current_user.id !=  params[:id].to_i
     redirect_to new_user_session_path
    else
      true
    end
  
  end


  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :self_introduction,
      :zip,
      :prefecture,
      :city_name,
      :block_name,
      :bill_name,
      :tel,
      :email,
      :password
    )
  end

  def myaddress_params
    params.require(:myaddress).permit(
      :zip,
      :prefecture,
      :city_name,
      :block_name,
      :bill_name,
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :tel
    )
  end

end
