class MarksController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy]
  
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
      flash[:success] = 'ブックマークを投稿しました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'ブックマークの投稿に失敗しました。'
      render 'new'
    end
  end
  
  def destroy
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
      params.require(:mark).permit(:url, :order_num_position).merge(title: title)
    end
  end
  
  def mark_order_params
    params.require(:mark).permit(:order_num_position)
  end
  
end
