class Cohort < ApplicationRecord
  validates :name, :start_date, :end_date, :instructor_id, presence: true
  has_a :instructor
  has_many :students
end
