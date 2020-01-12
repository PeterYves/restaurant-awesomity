class Lunch < ApplicationRecord
  belongs_to :user, optional: true
  has_many :resto_lunches, dependent: :destroy
  has_many :restos, through: :resto_lunches
  accepts_nested_attributes_for :resto_lunches, :reject_if => proc { |a| 
     a['lunch_id'].blank? }
  accepts_nested_attributes_for :restos
  validates :price,:name,presence: true
end
