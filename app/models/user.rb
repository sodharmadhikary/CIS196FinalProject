class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :balance, presence: true
  validate :first_name_capitalized
  validate :last_name_capitalized
  validate :valid_email
  validate :non_zero_balance

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

  private

  def first_name_capitalized
    errors.add(:first_name, 'should be capialized') if !first_name.nil? && first_name[0] != first_name[0].upcase
  end

  def last_name_capitalized
    errors.add(:last_name, 'should be capitalized') if !last_name.nil? && last_name[0] != last_name[0].upcase
  end

  def valid_email
    errors.add(:email, 'should be valid') if !email.nil? && (!email.include?('@') || !email.include?('.'))
  end

  def non_zero_balance
    errors.add(:balance, 'should be valid') if balance < 0
  end
end
