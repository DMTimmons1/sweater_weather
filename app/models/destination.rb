class Destination < ApplicationRecord

  has_many :forecasts
  has_many :destination_salaries
  has_many :salaries, through: :destination_salaries
end
