class Cohort < ApplicationRecord
  validates :name, presence: true
  belongs_to :course, optional: true
  has_one :instructor
  has_many :students
end
