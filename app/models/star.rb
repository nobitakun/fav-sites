class Star < ApplicationRecord
  belongs_to :mark
  belongs_to :user
  has_many :list_stars
  has_many :lists, through: :list_stars
  accepts_nested_attributes_for :list_stars, allow_destroy: true
end
