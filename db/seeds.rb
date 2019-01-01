# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

course1 = Course.new(name: "Baking", class_hours: 140)
cohort1 = Cohort.new(name: "Spring 2019")
instructor1 = Instructor.new(first_name: "Noah", last_name: "lastname", email: "email@example.com", password:'1234',active: true, education: "edu level", age: 47, salary: 10000)
student1 = Student.new(first_name: "Rich", last_name: "Wu", email: "example@example.com", password: "1234", enrolled: true, education: "hs", age: 23)
admin1 = Admin.create(first_name: "Ad", last_name: "Min", email: "admin@panel.com", password: "admin")
instructor1.save
student1.save
cohort1.instructor = instructor1
cohort1.students << student1
cohort1.save
course1.cohorts << cohort1
course1.save

10.times do
  Student.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.safe_email,
    password: "1234",
    enrolled: true,
    education: "PhD",
    age: 27
  )
end

10.times do
  Instructor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.safe_email,
    password: "1234",
    active: false,
    education: "PhD",
    age: 52,
    salary: 40000
  )
end
