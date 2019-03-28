class Category < ApplicationRecord
  has_many :category_marks
  has_many :marks, through: :category_marks
  
  validates :name, presence: true, length: { maximum: 25 }, uniqueness: true
  validates :slug, presence: true, length: { maximum: 25 }, uniqueness: true
  
end
