class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:edit]
  before_action :require_admin_logged_in, only: [:index]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new(root: false, admin: false)
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    if current_user != @user
      redirect_to @user
    end
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = '編集しました。'
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  
end
