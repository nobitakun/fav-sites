class CategoriesController < ApplicationController
  before_action :require_admin_logged_in, only: [:new, :create, :edit, :destroy]
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  def index
    @categories = Category.all
  end
  
  def show
    
    @categories = Category.all
    @marks = Mark.includes(:categories).where(categories: { id: @category.id })
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    
    if @category.save
      flash[:success] = 'カテゴリーを登録しました。'
      redirect_to categories_url
    else
      flash.now[:danger] = 'カテゴリーの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @category.update(category_params)
      flash[:success] = 'カテゴリーを編集しました。'
      redirect_to categories_url
    else
      render :edit
    end
  end
  
  def destroy
    if @category.marks.count > 0
      flash[:danger] = 'ブックマークが登録されているカテゴリーは削除できません。'
      redirect_to categories_url
    else
      @category.destroy
      flash[:success] = 'カテゴリーは削除されました'
      redirect_to categories_url
    end
  end
  
  private
  
  def set_category
    @category = Category.find(params[:id])
  end
  
  def category_params
    params.require(:category).permit(:name, :slug)
  end
  
  
end
