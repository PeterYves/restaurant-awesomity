class Resto < ApplicationRecord
  validates :location,:name,:photo,:website,:currency,:price_range,:table_booking,:cuisine,:online_delivery,presence: true
  belongs_to :user  
  has_many :resto_lunches, dependent: :destroy
  has_many :lunches, :through => :resto_lunches
  has_many :resto_breakfasts, dependent: :destroy
  has_many :breakfasts, :through => :resto_breakfasts
  
  accepts_nested_attributes_for :resto_lunches, :reject_if => proc { |a| 
    a['lunch_id'].blank? }
  accepts_nested_attributes_for :lunches

  accepts_nested_attributes_for :resto_breakfasts, :reject_if => proc { |a| 
    a['breakfast_id'].blank? }
  accepts_nested_attributes_for :breakfasts

  before_save do
    self.lunch.gsub!(/[\[\]\"]/,"") if attribute_present? ("lunch")
  end
  before_save do
    self.breakfast.gsub!(/[\[\]\"]/,"") if attribute_present? ("breakfast")
  end

  mount_uploader :photo, ImageUploader
end
