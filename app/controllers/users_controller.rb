class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user
  before_action :set_user, except:[:edit]
  before_action :set_myaddress, only:[:update, :myaddress]
  before_action :set_products, only: [:myproducts_exhibiting, :myproducts_trading, :myproducts_sold]

  def show
  end

  def edit
  end

  def update
# ストロングパラメータが片方nilだった場合、エラーを発生させるので、回避（requireメソッドの特徴）堀
    if params[:myaddress] == nil
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        redirect_to root_path
      end
    else params[:user] == nil
      if @myaddress.update(myaddress_params)
        redirect_to user_path(@user)
      else
        redirect_to root_path
      end
    end
  end

  def logout
  end

  def profile
  end

  def credit_add
    card = Card.where(user_id: current_user.id)
    redirect_to user_card_index_path(@user) if card.exists?
  end

  def credit_edit
  end
  
  def confirmation
  end

  def myaddress
  end

  def mail_pass
  end

  def tel
  end

  def myproducts_exhibiting
    @product = @products.where(status_id: "1")
  end

  def myproducts_trading
    @product = @products.where(status_id: "2")
  end

  def myproducts_sold
    @product = @products.where(status_id: "3")
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

  def set_user
    @user = User.find(params[:id])
  end

  def set_myaddress
    @myaddress = Myaddress.includes(:user).find_by(user_id: @user.id)
  end

  def set_products
    @products = Product.where(user_id: current_user.id)
  end

end
