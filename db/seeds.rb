# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@destination = Destination.create!(name: "Denver")
@forecast = Forecast.create!(summary: "sunny", temperature: "45 degrees", destination_id: @destination.id)
@salary_1 = Salary.create!(title: "Dev", min: "$120,000.00", max: "$350,000.00")
@salary_2 = Salary.create!(title: "Dog Walker", min: "$20,000.00", max: "$65,000.00")
@salary_3 = Salary.create!(title: "Mechanic", min: "$90,000.00", max: "$200,000.00")

DestinationSalary.create!(destination_id: @destination.id, salary_id: @salary_1.id )
DestinationSalary.create!(destination_id: @destination.id, salary_id: @salary_2.id )
DestinationSalary.create!(destination_id: @destination.id, salary_id: @salary_3.id )