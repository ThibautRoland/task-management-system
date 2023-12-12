# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Task.destroy_all
ProjectMember.destroy_all
Project.destroy_all
User.destroy_all

puts "Cleared Database"

i = 1

15.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "jamesbond#{i}@gmail.com",
    password: 'password',  # You might want to use a secure method for password handling in production
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
    title: Faker::Job.title,
    clearance_level: rand(1..5),
    username: Faker::Internet.user_name,
    address: Faker::Address.full_address
  )
  i += 1
end

# Create Projects
5.times do
  project = Project.create!(
    name: Faker::Lorem.words(number: 2).join(' '),
    description: Faker::Lorem.sentence,
    deadline: Faker::Date.forward(days: 30)
  )

  # Create Project Members and Tasks for each Project
  3.times do
    user = User.all.sample
    project_member = ProjectMember.create!(
      role: Faker::Job.position,
      project: project,
      user: user
    )
    Task.create!(
      description: Faker::Lorem.sentence,
      status: ['Not Started', 'In Progress', 'Completed'].sample,
      priority: rand(1..3),
      deadline: Faker::Date.forward(days: 30),
      project: project,
      project_member: project_member
    )
  end
end

puts "successfully seeded :)"
