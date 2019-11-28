class Api::Products3Controller < ApplicationController

  def create
    grandchild = Category.find(params[:id])
    size_tag = grandchild.size_tag
    @choices_for_size = Size.where(size_tag: size_tag)
  end

end