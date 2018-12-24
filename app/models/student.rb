class Student < ApplicationRecord
  validates :first_name, :last_name, :email, :password, :enrolled, :education, presence: true
  validates :age, numericality: {less_than: 150, only_integer: true}, presence: true
  # has_and_belongs_to_many :cohorts
  belongs_to :cohorts, optional: true
end
