require 'rails_helper'

RSpec.describe PurchaseController, type: :controller do
  let(:user) { create(:user) }
  let(:product) { create(:product) }

  describe "GET #index" do
    before do
      login user
    end
    end
    it "returns http success" do
      get :index, params: { product_id: product.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #done" do
    it "returns http success" do
      get :done
      expect(response).to have_http_status(:success)
    end
  end

end
