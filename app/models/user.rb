class User < ApplicationRecord
  has_many :lunches, dependent: :destroy
  has_many :breakfasts, dependent: :destroy
  has_many :restos, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
