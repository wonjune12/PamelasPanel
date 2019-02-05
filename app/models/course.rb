class Course < ApplicationRecord
  has_many :cohorts
  has_many :students, through: :cohort 
  has_one :instructor, through: :cohort
end
