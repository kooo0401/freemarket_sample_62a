class ProductsController < ApplicationController
  # before_action :category_ranking, only: :index
  # before_action :brand_ranking, only: :index

  def index
    @products = Product.order("id DESC").limit(10)
    # 以下、いずれproductsの内、人気カテゴリーベスト4、人気ブランドベスト4 10個ずつ持ってくるよう変更予定
    # ------------------------------------------------------------------------------------------------
    # コード案（上手くいくか未確認）
    # ranked_caegory_ids.each_with_index do |id, i|
    #   products_of_the_category = Product.where(id: id).order("id DESC").limit(10)
    #   instance_variable_set('@products_category_number' + i, products_of_the_category)
    # end
    #  category_rankingが上手くいったらbrand_rankingも同様にここに追加する
    # ------------------------------------------------------------------------------------------------
  end

  def new
  end

  def show
  end

  def edit
  end

  # 以下、productテーブルにcategory_idカラムとbrand_idカラムを追加した後に実装予定
  # ------------------------------------------------------------------------------------------------
  # def category_ranking
  #   ranked_category_ids = Product.group(:category_id).order('category_id DESC).limit(4).count(:category_id).keys
  #   @category_top4 = ids.map{|product_id| Product.find(product_id) }
  # end
  #  category_rankingが上手くいったらbrand_rankingも同様にここに追加する
  # ------------------------------------------------------------------------------------------------
  private


end
