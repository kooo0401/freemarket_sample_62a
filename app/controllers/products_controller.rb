class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :change]
  before_action :ensure_correct_product, only: [:change]

  def index
    @products = Product.order("id DESC").limit(10)
    # 以下、カテゴリ・
    # productsの内、人気カテゴリーベスト4、人気ブランドベスト4 10個ずつ持ってくるよう変更予定
    # ------------------------------------------------------------------------------------------------
    # @products_ladies = Product.where(category_id:?).order("id DESC").limit(10)
    # @products_mens = Product.where(category_id:?).order("id DESC").limit(10)
    # @products_homeappliance = Product.where(category_id:?).order("id DESC").limit(10)
    # @products_toys = Product.where(category_id:?).order("id DESC").limit(10)

    # @products_chanel = Product.where(brand_id:?).order("id DESC").limit(10)
    # @products_louisvuitton = Product.where(brand_id:?).order("id DESC").limit(10)
    # @products_supreme = Product.where(brand_id:?).order("id DESC").limit(10)
    # @products_nike = Product.where(brand_id:?).order("id DESC").limit(10)
    # ------------------------------------------------------------------------------------------------
  end

  def new
    # 以下、ログイン機能設計次第で要不要判断
    # 以下の記述はログイン、ログアウト機能の導入後にコメントアウトを外すこと
    # redirect_to: controller: :user, action: :ログイン画面に対応するアクション unless user_signed_in?
  end

  def show
    @product = Product.find(params[:id])
    #実際にテーブルからid:1のproductを取得できているかの記述。
    # @product = Product.find(params[:id])
    # 商品出品が可能になったら、一つ一つのproductからidで取得する。
    @grandchild = Category.find("#{@product.category_id}")
    @child = @grandchild.parent
    @parent = @child.parent
  end

  def edit

  end

  def create
    @product = Product.create
  end

  def change
  end

  def ensure_correct_product

    if current_user.id !=  params[:id].to_i
     redirect_to new_user_session_path
    else
      true
    end
  
  end


  # 以下、仮に人気カテゴリー、人気ブランドをリアルタイム対応させる場合の記述。
  # productテーブルにcategory_idカラムとbrand_idカラムを追加した後に実装予定
  # ------------------------------------------------------------------------------------------------
  # def category_ranking
  #   ranked_category_ids = Product.group(:category_id).order('category_id DESC).limit(4).count(:category_id).keys
  #   @category_top4 = ids.map{|product_id| Product.find(product_id) }
  # end
  #  category_rankingが上手くいったらbrand_rankingも同様にここに追加する
  # ------------------------------------------------------------------------------------------------
  private
  # 商品出品実装時にstrong parameterを追加する

end
