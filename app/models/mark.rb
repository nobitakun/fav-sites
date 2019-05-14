class Mark < ApplicationRecord
  belongs_to :user
  has_many :category_marks, dependent: :destroy
  has_many :categories, through: :category_marks
  
  include RankedModel
  ranks :order_num, with_same: :user_id
  
  validates :url, presence: true, length: { maximum: 255 }, uniqueness: false
  
end
