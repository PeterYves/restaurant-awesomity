class Lunch < ApplicationRecord
  belongs_to :resto, optional: true
  validates :price,:name,presence: true
end
