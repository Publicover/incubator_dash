# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# admin_dana = Admin.create!(name: "dana", email: "dana@dana.com", password: "password", role: "admin")
# admin_james = Admin.create!(name: "james", email: "james@james.com", password: "password", role: "admin")
# student_rupert = Student.create!(name: "rupert", email: "rupert@rupert.com", password: "password", role: "student",
#                admin_id: 1, assignment_ids: [])
# student_sebastian = Student.create!(name: "sebastian", email: "seb@seb.com", password: "password", role: "student",
#                 admin_id: 1, assignment_ids: [])
# student_vera = Student.create!(name: "vera", email: "vera@vera.com", password: "password", role: "student",
#                 admin_id: 1, assignment_ids: [])
# week_one = Assignment.create!(title: "Bio", description: "Write a bio",
#            completed: false, user_ids: [1, 2, 3], due_date: Date.new(2017, 1, 12))
# week_two = Assignment.create!(title: "Mission", description: "Write a mission statement",
#            completed: false, user_ids: [1, 2, 3], due_date: Date.new(2017, 12, 1))
# rupert_homework_one = Homework.create!(title: "bio sheet", user_id: 1, assignment_id: 1)
# rupert_homework_two = Homework.create!(title: "mission sheet", user_id: 1, assignment_id: 2)

admin_dana = User.create!(name: "dana", email: "dana@dana.com", password: "password",
             role: "admin", course_name: "GBO INC", assignment_ids: [])
admin_james = User.create!(name: "james", email: "james@james.com", password: "password",
             role: "admin", course_name: "GBO INC", assignment_ids: [])
student_rupert = User.create!(name: "rupert", email: "rupert@rupert.com", password: "password",
             role: "student", course_name: "GBO INC", assignment_ids: [])
student_vera = User.create!(name: "vera", email: "vera@vera.com", password: "password",
             role: "student", course_name: "GBO INC", assignment_ids: [])
week_one = Assignment.create!(title: "Bio", description: "Write a bio",
          completed: false, user_ids: [3, 4], due_date: Date.new(2017, 1, 12))
week_two = Assignment.create!(title: "Mission", description: "Write a mission statement",
           completed: false, user_ids: [3, 4], due_date: Date.new(2017, 12, 1))
rupert_homework_one = Homework.create!(title: "bio sheet", user_id: 3, assignment_id: 1)
rupert_homework_two = Homework.create!(title: "mission sheet", user_id: 3, assignment_id: 2)
