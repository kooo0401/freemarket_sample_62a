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
    @product.images.build
    # 10.times { @product.images.build }
    # ⇨ 毎回１０枚保存する（もしかしたらいらないかも：髙橋）
    
    # 以下、ログイン機能設計次第で要不要判断
    # 以下の記述はログイン、ログアウト機能の導入後にコメントアウトを外すこと
    # redirect_to: controller: :user, action: :ログイン画面に対応するアクション unless user_signed_in?

  end

  def show
    @product = Product.find(1)
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
    @product = Product.new(product_params)
    # @product = current_user.products.build(product_params)

    if @product.save
      params[:images][:image].each do |image|
        @product.images.create(image: image, product_id: @product.id)
      end
      flash[:notice] = '商品が出品されました'
      redirect_to root_path
    else
      render :new
      flash.alert = '再度入力してください'
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
    # ↑記述されたコントローラの内部でのみ、実行することができるメソッド。
    # 商品出品実装時にstrong parameterを追加する
    # → 髙橋担当！！
    # <大前提>：Strong Parameterを設定する理由
    # →画面内の入力項目以外のデータについては受け取らないようにできる →セキュリティを強固にできるメリット
 # ------------------------------------------------------------------------------------------------

  def product_params
    params.require(:product)
            .permit(:description, :name, :price, :delivery_charged,
                    :area, :delivery_days, :sales_status, :delivery_way, 
                    :category_id,
                    :brand_id,
                    :size_id,
                    images_attributes: [:image])
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