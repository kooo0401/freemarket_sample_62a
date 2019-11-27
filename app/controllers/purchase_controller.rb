class PurchaseController < ApplicationController

  require 'payjp'

  def index
    @product = Product.find_by(id: params[:product_id])
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
    product = Product.find_by(id: params[:product_id])
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
      :amount => product.price,
      :customer => card.customer_id,
      currency: :'jpy',
    )
    product.status_id = 3
    product.save
    redirect_to action: 'done'
  end


  def done
  end

end
