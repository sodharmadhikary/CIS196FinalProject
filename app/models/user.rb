class User < ApplicationRecord
  has_many :users_orders, dependent: :destroy
  has_many :orders, through: :users_orders
end
