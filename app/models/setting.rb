class Setting < ApplicationRecord
  validates :slug, presence: true
  validates :label, presence: true
  validates :content, presence: true
end
