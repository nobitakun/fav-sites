class Mark < ApplicationRecord
  belongs_to :user
  has_many :stars, dependent: :destroy
  has_many :category_marks, dependent: :destroy
  has_many :categories, through: :category_marks
  has_many :list_stars, through: :stars, dependent: :destroy
  
  validates :url, presence: true, length: { maximum: 255 }, uniqueness: true

end
