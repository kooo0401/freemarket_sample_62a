class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'ユーザーを編集しました'
    else
      # 訂正要
      render :profile_edit
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

  def confirmation_edit
    @user = User.find(params[:id])
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
    )
  end

end
