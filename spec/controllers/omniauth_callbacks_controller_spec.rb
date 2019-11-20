require 'rails_helper'


RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  

   describe '#facebook' do
    let(:user) { create(:user) }
    
    before do
      request.env["omniauth.auth"] = facebook_mock
      request.env["devise.mapping"] = Devise.mappings[:user]
      subject { get :facebook, params: { provider: "facebook" } }
    end
  
    context '認可サーバーから返ってきたメールアドレスを持つuserがすでに登録済みの場合' do
      before do
        user = create(:user, email: 'sample@test.com')
      end

      context 'sns_credentialレコードをすでに持っていた場合' do
        before do
          SnsCredential.create(provider: "facebook", uid: '12345', user_id: '1')
        end

        # # test1 未実装
        # example '正しいリダイレクト先に遷移するか' do
        #   login user
        #   expect(subject).to redirect_to @user, event: :authentication 
        # end
      end

      context 'sns_credentialレコードを持っていなかった場合' do

        # test 2
        example 'sns_credentialレコードが新規作成されるか' do
          expect { get :facebook, params: { provider: "facebook", uid: '123456' } }.to change(SnsCredential, :count).by(1)
        end
      end
    end
    context '認可サーバーから返ってきたメールアドレスを持つuserが未登録の場合' do
        before do
          auth.info.email = 'sample@test.com'
          # user = create(:user, email: 'sample@test.com')
          login user
        end

      # test 3
      # example 'sns_credentialレコードが新規作成されるか' do
      #       before do
      #         SnsCredential.create(provider: "facebook", uid: '12345', user_id: '1')
      #       end

      #       it '正しいリダイレクト先に行くか' do
      #         expect(subject).to sign_in_and_redirect @user, event: :authentication 
      #       end
      # end

    end
  end
   



# ---------------------------------------------------------------------------------------
    # ここは要らんような気がする
    # it "authが認可サーバーから帰ってこない" do
    #     request.env["omniauth.auth"] = nil
    #     expect { subject }.to raise_error("request.env[omniauth.auth]がありません")
    # end

    # it "認可サーバーから返ってきたメールアドレスを持つuserがすでに登録済み、かつ、sns_credentialレコードをすでに持っていた場合に、正しいリダイレクト先に行くか" do
    #   user = create(:user, email: 'sample@test.com')
    #   SnsCredential.create(provider: "facebook", uid: '12345', user_id: '1')
      # expect(subject).to sign_in_and_redirect @user, event: :authentication 
    # end

    # it "認可サーバーから返ってきたメールアドレスを持つuserがすでに登録済みだが、該当するsns_credentialレコードがなかった場合、レコードが作成されるか" do
    #   user = create(:user, email: 'sample@test.com')
    #   expect { get :facebook, params: { provider: "facebook", uid: '123456' } }.to change(SnsCredential, :count).by(1)
    # end

    # it "認可サーバーから返ってきたメールアドレスを持つuserがすでに登録済みだが、該当するsns_credentialレコードがなかった場合に、正しいリダイレクト先に行くか" do
    #   user = create(:user, email: 'sample@test.com')
      
    # end

    # it "認可サーバーから返ってきたメールアドレスを持つuserが未登録であった場合、sns_credentialレコードが新しく作成されるか" do
    #   user = create(:user)
    #   expect(subject).to change(SnsCredential, :count).by(1)
    # end

    # it "認可サーバーから返ってきたメールアドレスを持つuserが未登録であった場合、正しいリダイレクト先に行くか" do
    # end

  

  context 'Google認証用テスト' do
  end

end
