class Student < ApplicationRecord
  validates :firstname, :lastname, :email, presence: true
  validates :age, numericality: { greater_than: 0, message: "must be at least 1 year old"}
  has_many :cohortstudents
  has_many :cohorts, through: :cohortstudent
  belongs_to :course, required: false
end
