class MarksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_mark, only: [:edit, :update, :destroy]
  
  def index
    @marks = Mark.order(created_at: :desc)
    @categories = Category.all
  end
  
  def new
    @mark = Mark.new
  end
  
  def create
    @mark = current_user.marks.build(mark_params)
    unless @mark.url.match(/\/$/)
      @mark.url = @mark.url + '/'
    end
    if @mark.save
      flash[:success] = 'ブックマークを設定しました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'ブックマークの設定に失敗しました。'
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @mark.update(edit_mark_params)
      flash[:success] = '編集しました。'
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
    unless @mark.protect
      @mark.destroy
      flash[:success] = '削除しました'
      redirect_to root_path
    else
      flash[:danger] = '保護されているため削除できません'
      render :edit
    end
    
  end
  
  def sort
    mark = Mark.find(params[:mark_id])
    mark.update(mark_order_params)
    head :no_content
  end
  
  def search
    if params[:keyword].present?
      keyword = params[:keyword]
      @marks = Mark.where("url LIKE ? OR title LIKE ?","%" + keyword + "%", "%" + keyword + "%")
    else
      @marks = Mark.order(created_at: :desc)
    end
    @categories = Category.all
  end
  
  def category
    @category = Category.find_by(slug: params[:slug])
    @categories = Category.all
    @marks = Mark.includes(:categories).where(categories: { id: @category.id })
  end
  
  private
  
  def set_mark
    @mark = Mark.find(params[:id])
  end
  
  def correct_user
    @mark = Mark.find(params[:id])
    if @mark.user.id != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to root_path
    end
  end
  
  def mark_params
    if params[:mark][:url].match(/\A#{URI::regexp(%w(http https))}\z/)
      require 'mechanize'
      begin
        agent = Mechanize.new
        page = agent.get(params[:mark][:url])
        title = page.title
      rescue Timeout::Error 
        title = params[:mark][:url]
      end
      params.require(:mark).permit(:url, :protect, :order_num_position).merge(title: title)
    end
  end
  
  def edit_mark_params
    params.require(:mark).permit(:url, :title, :protect)
  end
  
  def mark_order_params
    params.require(:mark).permit(:order_num_position)
  end
  
end
