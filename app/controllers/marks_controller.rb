class MarksController < ApplicationController
  
  def index
    @marks = Mark.order(created_at: :desc)
    @categories = Category.all
  end
  
  def new
    @mark = Mark.new
  end
  
  def create
    @mark = current_user.marks.build(mark_params)
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
  
  private
  
  def mark_params
    params.require(:mark).permit(:name, :url, :favicon, :memo)
  end
  
end
