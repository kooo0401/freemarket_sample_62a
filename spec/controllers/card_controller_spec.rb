require 'rails_helper'

RSpec.describe CardController, type: :controller do
  let(:user) { create(:user) }
  
  describe "GET #show" do
    before do
      login user
    end

    context "cardがない場合" do 
      it "redirect to new_user_card_path" do
        get :show, params: { user_id: user.id }
        expect(response).to redirect_to new_user_card_path(user.id)
      end
    end

    # 以下、APi_keyをローカル導入後に実装予定
    # context "cardがすでにある場合" do
    # end

  end

end
