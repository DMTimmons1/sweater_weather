class Salary < ApplicationRecord
  has_many :destination_salaries
  has_many :destinations, through: :destination_salaries
end
