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

  # def myaddress_edit
  #   @user = User.find(params[:id])
  # end

  # def mail_pass_edit
  #   @user = User.find(params[:id])
  # end

  # def tel_edit
  #   @user = User.find(params[:id])
  # end
end
