class UserConfig < ApplicationRecord
  belongs_to :user
  
  mount_uploader :bg_image, ImageUploader
  
  validates :mark_target, presence: true
  validates :language_setting, presence: true
  validates :col_num, presence: true
end
