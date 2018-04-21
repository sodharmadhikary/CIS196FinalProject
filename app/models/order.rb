class Order < ApplicationRecord
  has_many :orders_foods, dependent: :destroy
  has_many :foods, through: :orders_food
  has_many :users_orders, dependent: :destroy
  has_many :users, through: :users_order

  def add_food(food)
    return if Orders_food.exists?(order: self, food: food)
    Orders_food.new(order: self, food: food).save
  end

end
