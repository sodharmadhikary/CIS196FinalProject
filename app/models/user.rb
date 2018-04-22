class User < ApplicationRecord
  has_many :users_orders, dependent: :destroy
  has_many :orders, through: :users_orders

  include BCrypt

  def full_name
    first_name + ' ' + last_name
  end

  def password
    @password ||= Password.new(password_hash) unless password_hash.nil?
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
