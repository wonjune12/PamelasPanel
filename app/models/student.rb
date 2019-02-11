class Student < ApplicationRecord
  validates :email, uniqueness: true
  validates :age, numericality: { greater_than: 0, message: "must be greater than 0" }
  validates :degree, inclusion: { 
                      in: %w(Highschool Bachelors Masters, Ph.D), 
                      message: "Must have one of these degrees" }
  has_many :cohortstudents
  has_many :cohorts, through: :cohortstudents
  belongs_to :course, required: false
end
