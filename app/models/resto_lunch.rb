class RestoLunch < ApplicationRecord
  belongs_to :lunch
  belongs_to :resto
end
