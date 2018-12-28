class Instructor < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :education, presence: true
  validates :active, default: false
  validates :email, presence: true
  validates :age, numericality:{ less_than: 150, only_integer: true},presence: true
  validates :salary, numericality: { greater_than: 0, only_integer: true}, presence: true
  # has_and_belongs_to_many :cohorts
  has_many :cohorts
end
