class Student < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :education, presence: true
  validates :email, presence: true
  validates :enrolled, default: false
  validates :age, numericality: {less_than: 150, only_integer: true}, presence: true
  # has_and_belongs_to_many :cohorts
  belongs_to :cohorts, optional: true
  def full_credentials
  "#{last_name}, #{first_name} - #{id}"
  end
end
