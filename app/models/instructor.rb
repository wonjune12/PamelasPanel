class Instructor < ApplicationRecord
  # validates_numericality_of :age, :in => 1..150
  # validates_numericality_of :salary, :in => 0
  has_many :courses
  has_many :cohorts

end
