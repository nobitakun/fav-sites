class StarsController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :create, :destroy] 
  
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

  def destroy
    @star = Star.find_by(params[:mark_id])
    @star.destroy
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def star_params
    params.permit(:mark_id, :user_id)
  end
end
