class ProductsController < ApplicationController

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
    @product = Product.new
  end

  def show
    @products = Product.order('id desc').limit(6)
  end

  def edit
  end

  def create
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
