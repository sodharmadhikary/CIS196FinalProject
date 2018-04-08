class Food < ApplicationRecord
  has_many :orders_foods, dependent: :destroy
  has_many :orders, through: :orders_foods
end
