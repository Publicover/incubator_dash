# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin_dana = Admin.create!(name: "dana", email: "dana@dana.com", password: "password", flavor: "admin")
admin_james = Admin.create!(name: "james", email: "james@james.com", password: "password", flavor: "admin")
student_rupert = Student.create!(name: "rupert", email: "rupert@rupert.com", password: "password", flavor: "student",
               admin_id: 1, assignment_ids: [])
student_sebastian = Student.create!(name: "sebastian", email: "seb@seb.com", password: "password", flavor: "student",
                admin_id: 1, assignment_ids: [])
student_vera = Student.create!(name: "vera", email: "vera@vera.com", password: "password", flavor: "student",
                admin_id: 1, assignment_ids: [])
week_one = Assignment.create!(title: "Bio", description: "Write a bio",
           completed: false, student_ids: [1, 2, 3], due_date: Date.new(2017, 1, 12))
week_two = Assignment.create!(title: "Mission", description: "Write a mission statement",
           completed: false, student_ids: [1, 2, 3], due_date: Date.new(2017, 12, 1))
