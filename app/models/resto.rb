class Resto < ApplicationRecord
  validates :location,:name,:photo,:website,:currency,:price_range,:table_booking,:cuisine,:online_delivery,presence: true
  belongs_to :user, optional: true  
  has_many :lunches, dependent: :destroy
  has_many :breakfasts, dependent: :destroy
  
  accepts_nested_attributes_for :lunches, reject_if: :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :breakfasts, reject_if: :all_blank, :allow_destroy => true

  mount_uploader :photo, ImageUploader
end
