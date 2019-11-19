require 'rails_helper'

describe ProductsController do

  describe 'Omniauth protocol' do
  it 'sns_credentialレコードを持っていた場合に,@userを作れるか' do
    products = build(:user, 10)
    get :index
    expect(assigns(:products)).to match(products.sort{|a, b| b <=> a})
  end

  it 'render top page' do
    get :index
    expect(response).to render_template :index
  end

  # describe 'HTTPメソッド名 #アクション名' do
  #   it "インスタンス変数は期待した値になるか？" do
  #      "擬似的にリクエストを行ったことにするコードを書く"
  #     "エクスペクテーションを書く"
  #   end

  #   it "期待するビューに遷移するか？" do
  #     "擬似的にリクエストを行ったことにするコードを書く"
  #     "エクスペクテーションを書く"
  #   end
  # end
end



end