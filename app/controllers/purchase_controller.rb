class PurchaseController < ApplicationController
  before_action :set_product, only: [:index, :pay]
  before_action :user_restriction, except: [:done]
  require 'payjp'

  def index
    @user = User.find(current_user.id)
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to new_user_card_path(@user)
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      customer: card.customer_id,
      currency: :'jpy',
    )
    @product.update(status_id: 3)
    if @product.save(validate: false)
      redirect_to action: 'done'
    else
      flash[:notice] = '問題が発生して処理を中止しました。'
      redirect_to root_path
    end
  end


  def done
  end

  private

  def set_product
    @product = Product.find_by(id: params[:product_id])
  end

  def user_restriction
    redirect_to root_path if current_user.id == @product.user_id
  end

end
