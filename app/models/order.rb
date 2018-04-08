class Order < ApplicationRecord
  has_many :orders_foods, dependent: :destroy
  has_many :foods, through: :orders_food
  has_many :users_orders, dependent: :destroy
  has_many :users, through: :users_order
end
