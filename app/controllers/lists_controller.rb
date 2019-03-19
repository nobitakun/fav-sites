class ListsController < ApplicationController
  def index
    
  end

  def show
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      flash[:success] = 'リストを作成しました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'リストの作成に失敗しました。'
      render 'static_pages#home'
    end
  end

  def destroy
  end
  
  private
  
  def list_params
    params.require(:list).permit(:name)
  end
  
  
end
