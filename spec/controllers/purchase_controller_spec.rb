require 'rails_helper'

RSpec.describe PurchaseController, type: :controller do
  let(:user) { create(:user) }
  let(:product) { create(:product) }

  describe "GET #index" do
    before do
      login user
    end

    context "purchase#indexを実行したとき" do
      before do
        get :index, params: { product_id: product.id }
      end
      it "redirect_to new_user_card_path" do
        expect(response).to redirect_to new_user_card_path(user.id)
      end
    end
  end

  describe "GET #done" do
    context "purchase#doneを実行したとき" do
      before do
        get :done, params: { product_id: product.id }
      end

      it "redirect_tp done_product_purchase_index" do
        expect(response).to have_http_status(:ok)
      end
    end
  end

end
