require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  let(:user) { create(:user) }
  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end
  
   describe '#facebook' do
    before do
      request.env["omniauth.auth"] = facebook_mock
    end
    context '認可サーバーから返ってきたメールアドレスを持つuserがすでに登録済みの場合' do
      before do
        user = create(:user, email: 'sample@test.com')
      end

      context 'sns_credentialレコードを持っていなかった場合' do
        example 'sns_credentialレコードが新規作成されるか' do
          expect { get :facebook, params: { provider: "facebook", uid: '123456' } }.to change(SnsCredential, :count).by(1)
        end
      end
    end

  end

  describe '#google_oauth2' do
    before do
      request.env["omniauth.auth"] = google_oauth2_mock
    end
    context '認可サーバーから返ってきたメールアドレスを持つuserがすでに登録済みの場合' do
      before do
        user = create(:user, email: 'sample@test.com')
      end

      context 'sns_credentialレコードを持っていなかった場合' do
        example 'sns_credentialレコードが新規作成されるか' do
          expect { get :google_oauth2, params: { provider: "facebook", uid: '123456' } }.to change(SnsCredential, :count).by(1)
        end
      end
    end
  end

end
