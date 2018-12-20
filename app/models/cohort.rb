class Cohort < ApplicationRecord
  validates :name, :start_date, :end_date, :instructor_id, presence: true
  belongs_to :course
  has_one :instructor
  has_many :students
end
