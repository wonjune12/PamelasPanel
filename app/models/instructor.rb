class Instructor < ApplicationRecord
  validates :age, numericality: { greater_than: 0, less_than: 150, message: "must be greater than 0"}
  validates :salary, numericality: {greater_than: 0, message: "You have to pay the person"}
  validates :degree, inclusion: { 
                      in: %w(Highschool Bachelors Masters Ph.D), 
                      message: "Must have one of these degrees" }
  has_many :cohortinstructors
  has_many :cohorts, through: :cohortinstructors

end
