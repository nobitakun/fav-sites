class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @mark = current_user.marks.build
      @marks = current_user.marks.order('created_at DESC')
      
      @stars = current_user.stars.order('created_at DESC')
      
      @list = current_user.lists.build
      @lists = current_user.lists.order('created_at DESC')
    end
  end
  
  def dbmap
  end
end
