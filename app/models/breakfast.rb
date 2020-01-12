class Breakfast < ApplicationRecord
  belongs_to :user, optional: true
  has_many :resto_breakfasts, dependent: :destroy
  has_many :restos, through: :resto_breakfasts
  accepts_nested_attributes_for :resto_breakfasts, :reject_if => proc { |a| 
     a['breakfast_id'].blank? }
  accepts_nested_attributes_for :restos
  validates :price,:name,presence: true
end
