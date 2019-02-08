class Instructor < ApplicationRecord
  has_many :cohortinstructors
  has_many :cohorts, through: :cohortinstructors

end
