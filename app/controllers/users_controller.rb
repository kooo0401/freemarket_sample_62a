class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def logout_page
    @user = User.find(params[:id])
  end

  def profile_edit
    @user = User.find(params[:id])
  end

  def credit_edit
    @user = User.find(params[:id])
  end

  def confirmation_edit
    @user = User.find(params[:id])
  end
end
