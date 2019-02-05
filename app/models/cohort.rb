class Cohort < ApplicationRecord
  has_many :courses 
  has_many :students
  has_one :instructor
end
