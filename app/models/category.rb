class Category < ApplicationRecord
  has_many :category_marks
  has_many :marks, through: :category_marks
end
