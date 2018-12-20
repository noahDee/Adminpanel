# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

course = Course.create(name: "Baking", class_hours: 140)
cohort = Cohort.create(name: "Spring 2019", start_date: 1/6/2019, end_date: 1/29/2019,instructor_id: nil)
instructor = Instructor.create(first_name: "Noah", last_name: "lastname", email: "email@example.com", password: "1234",active: true, education: "edu level", age: 47, salary: 10000)
students = Student.create(first_name: "Rich", last_name: "Wu", email: "example@example.com", password: "1234", enrolled: true, education: "hs", age: 23)
