class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @mark = current_user.marks.build
      @marks = current_user.marks.order('created_at DESC')
    end
  end
  
  def dbmap
  end
end
