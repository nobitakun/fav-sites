class SettingsController < ApplicationController
  before_action :require_admin_logged_in
  before_action :set_setting, only: [:edit, :update]
  
  def index
    @settings = Setting.all
  end

  def new
    @setting = Setting.new
  end

  def create
    @setting = Setting.new(setting_params)
    if @setting.save
      flash[:success] = '設定項目を登録しました。'
      redirect_to settings_path
    else
      flash.now[:danger] = '設定項目の登録に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
    if @setting.update(setting_params)
      flash[:success] = '編集しました。'
      redirect_to settings_path
    else
      render :edit
    end
  end

  def destroy
  end
  
  private
  
  def set_setting
    @setting = Setting.find(params[:id])
  end
  
  def setting_params
    params.require(:setting).permit(:id, :label, :content, :order_num)
  end

end
