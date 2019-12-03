class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :change, :destroy, :edit]
  before_action :set_product, only: [:destroy, :change, :show, :edit, :ensure_correct_product, :sell_edit]
  before_action :set_category, only: [:show, :change]
  before_action :ensure_correct_product, except: [:index, :new, :show, :edit, :create]
  before_action :set_image, only: [:show, :change,:sell_edit]
  before_action :set_current_category_group, only: :sell_edit
  before_action :set_current_size_for_sell_edit, only: :sell_edit
  before_action :user_restriction, only: [:edit]

  


  def index
    @products_ladies = Product.where(category_id: 33..230).order("id DESC").limit(10)
    @products_mens = Product.where(category_id:245..388, status_id: 1).order("id DESC").limit(10)
    @products_chanel = Product.where(brand_id: 1, status_id: 1).order("id DESC").limit(10)
    @products_louisvuitton = Product.where(brand_id: 2,status_id: 1).order("id DESC").limit(10)
  end

  def new
    @product = Product.new
    @product.images.build
    @parent = Category.where(id: 1..13)
  end


  def show
    @products = Product.order("id DESC").limit(6)
    if user_signed_in?
      redirect_to  users_myproduct_change_users_path(@product) if @product.user_id == current_user.id
    end
  end

  def change
    @product = Product.find(params[:id])
  end

  def edit
    gon.product_price = @product.price
    gon.all_point = current_user.point
  end

  def sell_edit
    @parent_group = Category.where(id: 1..13)
    @product_fee = (@product.price * 0.1).round
    @product_profit = (@product.price * 0.9).round
  end

  def update 
    @product = Product.find(params[:id])
    if @product.update(product_params) 
      redirect_to users_myproduct_change_users_path(@product)
    else       
      redirect_to myedit_users_path(@product)
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
    else
      redirect_to new_product_path
    end
  end
  
  def destroy
    if @product.destroy
      redirect_to myproducts_exhibiting_user_path(current_user)
    else
      flash[:notice] = '問題が発生して削除できませんでした'
      redirect_to root_path
    end
  end
  
  private

  def product_params
    params.require(:product)
            .permit(:description, :name, :price, :delivery_charged,
                    :prefecture_id, :delivery_days, :sales_status, :delivery_way, 
                    :category_id,
                    :brand,
                    :size_id,
                    images_attributes: [:image, :id])
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

  def set_image
    @image = @product.images.first
    @images = @product.images
  end

  def ensure_correct_product
    @product = Product.find(params[:id])
    redirect_to root_path if current_user.id !=  @product.user_id
  end

  def set_current_category_group
    @selected_grandson_category = Category.find(@product.category_id)
    @selected_child_category = @selected_grandson_category.parent
    @selected_parent_category = @selected_child_category.parent
    @grandchild_group = @selected_grandson_category.siblings
    @child_group = @selected_child_category.siblings
  end

  def set_current_size_for_sell_edit
    if @size.present?
      gon.selected_size = @size
      if @size.size_tag.present?
        @size_tag_group = Size.where(size_tag: @size.size_tag)
      elsif
        @size_tag_group = Size.where(id: 1..2)
      end
    elsif
      @size = Size.find(1)
      @size_tag_group = Size.where(id: 1..2)
      gon.selected_size = nil
    end
  end

  def user_restriction
    @product = Product.find(params[:id])
    redirect_to root_path if current_user.id == @product.user_id
  end

end

