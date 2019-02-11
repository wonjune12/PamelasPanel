class Course < ApplicationRecord
  validates :hoursinclass, numericality: {greater_than: 0, message: "Must be greater than 0"}
  has_many :cohorts
  has_one :instructor, through: :cohort
end
