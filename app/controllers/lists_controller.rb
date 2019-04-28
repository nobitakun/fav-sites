class ListsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy]
  
  def index
    @lists = current_user.lists.order(created_at: :desc)
  end

  def show
    @list = List.find(params[:list_id])
  end
  
  def new
    @list = current_user.lists.build
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      flash[:success] = 'セットを作成しました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'セットの作成に失敗しました。'
      render 'new'
    end
  end
  
  def edit
    @list = List.find(params[:id])
    @list.list_stars.build
  end
  
  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      flash[:success] = '編集しました。'
      redirect_to @list
    else
      render :edit
    end
  end

  def destroy
  end
  
  private
  
  def list_params
    params.require(:list).permit(:name, list_stars_attributes: [:id, :star_id])
  end
  
  
end
