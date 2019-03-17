class Mark < ApplicationRecord
  belongs_to :user
  has_many :stars
  has_many :category_marks
  has_many :categories, through: :category_marks
end
