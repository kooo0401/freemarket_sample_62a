class Api::ProductsController < ApplicationController

  def create
    parent = Category.find(params[:id])
    @children = parent.children
  end

end

