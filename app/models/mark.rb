class Mark < ApplicationRecord
  belongs_to :user
  has_many :category_marks, dependent: :destroy
  has_many :categories, through: :category_marks
  
  validates :url, presence: true, length: { maximum: 255 }, uniqueness: false

end
