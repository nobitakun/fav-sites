class UserConfigsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_config, only: [:show, :edit, :update]
  
  def show
  end
  
  def edit
  end
  
  def update
    
    if params[:bg_delete_flug].present?
      @user_config.remove_bg_image!
    end
    
    if @user_config.update(user_config_params)
      flash[:success] = '設定を変更しました。'
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private
  
  def set_user_config
    @user_config = current_user.user_config
  end
  
  def user_config_params
    params.require(:user_config).permit(:mark_target, :language_setting, :bg_image, :col_num)
  end
  
end
