class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :change]
  # before_action :ensure_correct_product, only: [:change]

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
    @product = Product.find(params[:id])
    #実際にテーブルからid:1のproductを取得できているかの記述。
    # @product = Product.find(params[:id])
    # 商品出品が可能になったら、一つ一つのproductからidで取得する。
    @grandchild = Category.find("#{@product.category_id}")
    @child = @grandchild.parent
    @parent = @child.parent
    redirect_to "/users/#{current_user.id}/products/#{@product.id}" if @product.user_id == current_user.id
  end

  def edit
    @product = Product.find(params[:id])
    gon.product_price = @product.price
    gon.all_point = current_user.point
  end

  
  def create
    @product = Product.new(product_params)
    # @product = current_user.products.build(product_params)
    if @product.save
      # 下記コメントアウト３行は今後使用予定です 191124 髙橋
      # params[:images][:image].each do |image|
      #   @product.images.create(image: image, product_id: @product.id)
      # end
      flash[:notice] = '商品が出品されました'
      redirect_to root_path
    else
      render :new
      flash.alert = '再度入力してください'
    end
  end
  #まだ実装途中櫻田
  # def destroy
  #   product = Product.find(params[:id])
  #   if product.user_id == current_user.id
  #     product.destroy 
  #   end
  # end


  def change
  end

  # def ensure_correct_product

  #   if current_user.id !=  params[:id].to_i
  #    redirect_to new_user_session_path
  #   else
  #     true
  #   end
  
  # end



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
end