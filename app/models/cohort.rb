class Cohort < ApplicationRecord
  belongs_to :course 
  has_many :cohortstudent
  has_many :cohortinstructors
  has_many :students, through: :cohortstudents
  has_many :instructors, through: :cohortinstructors
end
