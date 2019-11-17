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
  end

  def edit
  end

  def create

    @product = Product.new(product_params)
    if @product.save
      # ビュー（アラートでビューを表示）
      #   続けて出品する（リンク product/new）
      #   商品詳細ページへ (リンク product/show)
    else
      # render :new
      # 入力内容がおかしい所に赤字で表示
        # → 例：選択して下さい
        # おそらくJS
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
    #  ↑ ちなみに、Privateメソッドとは？
    # 記述されたコントローラの内部でのみ、実行することができるメソッド。

      # 商品出品実装時にstrong parameterを追加する
    # → 髙橋担当！！
    # <大前提>：Strong Parameterを設定する理由
    # →画面内の入力項目以外のデータについては受け取らないようにできる
    # →セキュリティを強固にできるメリットがある
 # ------------------------------------------------------------------------------------------------

  def product_params
    params.require(:product)
            .permit(:description, :name, :price, :delivery_charged,
                    :area, :delivery_days, :seles_status, :delivery_way, 
                    :category_id,
                    :brand_id,
                    :size_id,
                    images: [:image])
          .merge(user_id: current_user.id)
  end

    # 事実：product.images[0].image でトップページで画像が取得できている
      # ⇨ product.images.image で 出品したproductのimagesのimageを取得できるはず。。。
    # mergeメソッドを使うことによって、ストロングパラメーター(create_params)が生成される際にuser_idとgroup_idのキーと値を持つハッシュを追加することができます。
    # ＜要検討事項＞
    # category_id  →  取得必須（入力アリ）
    # brand_id  →  取得必須（入力アリ）
    # size_id  →  取得必須（入力アリ）
    # status_id  →  入力欄ナシ（最初は必ず”出品中”という表現になるはず）
end
