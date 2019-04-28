class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @mark = current_user.marks.build
      @marks = current_user.marks.rank(:order_num)
    else
      @marks = Mark.order(created_at: :desc)
    end
  end
  
  def dbmap
  end
end
