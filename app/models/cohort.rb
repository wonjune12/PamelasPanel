class Cohort < ApplicationRecord
  belongs_to :course, required: false
  has_many :cohortstudents
  has_many :cohortinstructors
  has_many :students, through: :cohortstudents
  has_many :instructors, through: :cohortinstructors
end
