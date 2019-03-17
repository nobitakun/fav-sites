class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def create
  end

  def show
    @category = Category.find_by(slug: params[:slug])
    @categories = Category.all
    @marks = Mark.includes(:categories).where(categories: { id: @category.id })
  end

  def destroy
  end
end
