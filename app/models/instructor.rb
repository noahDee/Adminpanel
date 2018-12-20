class Instructor < ApplicationRecord
  validates :first_name, :lastname, :email, :password, :active, :education, presence: true
  validates :age, numericality:{ less_than: 150, only_integer: true},presence: true
  validates :salary, numericality: { greater_than: 0, only_integer: true}, presence: true
end
