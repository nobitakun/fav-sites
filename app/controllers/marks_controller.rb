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
      @star = current_user.stars.create(mark_id: @mark.id, user_id: current_user.id)
      flash[:success] = 'ブックマークを投稿しました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'ブックマークの投稿に失敗しました。'
      render 'new'
    end
  end
  
  def destroy
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
      params.require(:mark).permit(:url).merge(title: title)
    end
  end
  
end
