class StarsController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :create, :edit, :update, :destroy]
  # before_action :store_location, only: [:edit]
  
  def index
    if logged_in?
      @stars = current_user.stars
    end
  end

  def create
    @star = current_user.stars.build(star_params)
    @star.save!
    redirect_back(fallback_location: root_path)
  end
  
  def edit
    @star = Star.find(params[:star_id])
  end
  
  def update
    @star = Star.find(params[:star_id])
    if @star.update(edit_star_params)
      flash[:success] = '編集しました。'
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @star = Star.find_by(params[:mark_id])
    @star.destroy
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def star_params
    params.permit(:mark_id, :user_id, :label)
  end
  
  def edit_star_params
    params.require(:star).permit(:id, :label, list_stars_attributes: [:id, :list_id])
  end
  
  
end
