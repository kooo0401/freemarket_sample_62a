class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :change, :destroy, :edit]
  before_action :set_product, only: [:destroy, :change, :show, :edit, :ensure_correct_product]
  before_action :set_category, only: [:show, :change]
  before_action :ensure_correct_product, only: [:change]


  def index
    # @products = Product.order("id DESC").limit(10)
    # @products = Product.where(status_id: 1).order("id DESC").limit(10)

    # 以下、カテゴリ・
    # productsの内、人気カテゴリーベスト4、人気ブランドベスト4 10個ずつ持ってくるよう変更予定
    # ------------------------------------------------------------------------------------------------
    @products_ladies = Product.where(category_id: 33..230).order("id DESC").limit(10)
    @products_mens = Product.where(category_id:245..388, status_id: 1).order("id DESC").limit(10)
    # @products_homeappliance = Product.where(category_id:?).order("id DESC").limit(10)
    # @products_toys = Product.where(category_id:?).order("id DESC").limit(10)

    @products_chanel = Product.where(brand_id: 1, status_id: 1).order("id DESC").limit(10)
    @products_louisvuitton = Product.where(brand_id: 2,status_id: 1).order("id DESC").limit(10)
    # @products_supreme = Product.where(brand_id:?).order("id DESC").limit(10)
    # @products_nike = Product.where(brand_id:?).order("id DESC").limit(10)
    # ------------------------------------------------------------------------------------------------
  end

  def new
    @product = Product.new
    @product.images.build
    @parent = Category.where(id: 1..13)
  end


  def show
    @products = Product.order("id DESC").limit(6)
    @images = @product.images.where(product_id: @product.id)
    #実際にテーブルからid:1のproductを取得できているかの記述。
    # 商品出品が可能になったら、一つ一つのproductからidで取得する。
    if user_signed_in?
      redirect_to  users_myproduct_change_users_path(@product) if @product.user_id == current_user.id
    end
  end

  def edit
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

    else
      render :new
    end
  end
  
  def destroy
    if @product.destroy
      flash[:notice] = '商品が削除されました'
      redirect_to myproducts_exhibiting_user_path(current_user)
    else
      flash[:notice] = '問題が発生して削除できませんでした'
      redirect_to root_path
    end
  end


  def change
  end

  def ensure_correct_product

    redirect_to root_path if current_user.id !=  @product.user_id

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

  def product_params
    params.require(:product)
            .permit(:description, :name, :price, :delivery_charged,
                    :area, :delivery_days, :sales_status, :delivery_way, 
                    :category_id,
                    :brand,
                    :size_id,
                    images_attributes: [:image])
          .merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
    if @product.size_id.present?
      @size = Size.find(@product.size_id)
    end
  end

  def set_category
    @grandchild = Category.find("#{@product.category_id}")
    @child = @grandchild.parent
    @parent = @child.parent
  end
end