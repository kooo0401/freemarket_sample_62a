class Api::Products2Controller < ApplicationController
  def create
    children = Category.find(params[:id])
    @grandchildren = children.children
  end
end