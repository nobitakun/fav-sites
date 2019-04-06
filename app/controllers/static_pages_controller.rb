class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @mark = current_user.marks.build
      @marks = current_user.marks.order('created_at DESC')
      
      @list = current_user.lists.build
      @lists = current_user.lists.order('created_at DESC')
    else
      @marks = Mark.order(created_at: :desc)
    end
  end
  
  def dbmap
  end
end
