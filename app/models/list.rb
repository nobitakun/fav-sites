class List < ApplicationRecord
  belongs_to :user
  has_many :list_stars, dependent: :destroy
  has_many :stars, through: :list_stars
  accepts_nested_attributes_for :list_stars, allow_destroy: true
  
  validates :name, presence: true, length: { maximum: 25 }, uniqueness: true
end
