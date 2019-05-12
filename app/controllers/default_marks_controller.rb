class DefaultMarksController < ApplicationController
  before_action :require_admin_logged_in
  
  def index
    @default_marks = DefaultMark.all
  end

  def edit
    @default_mark = DefaultMark.find(params[:id])
  end
  
  def update
    @default_mark = DefaultMark.find(params[:id])
    if @default_mark.update(default_mark_params)
      
      marks = Mark.where(url: params[:current_url])
      
      if marks.any?
        marks.each do |mark|
          mark.url = params[:default_mark][:url]
          mark.save!
        end
        p marks.count.to_s + '件のURLを変更しました'
      else
        p '該当なし'
      end
      

      
      flash[:success] = '編集しました。'
      redirect_to default_marks_path
    else
      render :edit
    end
  end
  
  private
  
  def default_mark_params
    params.require(:default_mark).permit(:id, :title, :url, :order_num)
  end
  
end
