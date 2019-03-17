class CategoryMark < ApplicationRecord
  belongs_to :mark
  belongs_to :category
end
