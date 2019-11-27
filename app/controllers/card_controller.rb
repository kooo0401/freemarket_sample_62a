class CardController < ApplicationController

  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "show"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to controller: "signup", action: "user_registration4"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = Card.where(user_id: current_user.id).first
    @user = User.find(params[:user_id])
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to user_path(@user)
  end

  def show #Cardのデータをpayjpに送り情報を取り出します
    card = Card.where(user_id: current_user.id).first
    @user = User.find(params[:user_id])
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def addition
    card = Card.where(user_id: current_user.id)
    @user = User.find(params[:user_id])
    redirect_to action: "show" if card.exists?
  end

end