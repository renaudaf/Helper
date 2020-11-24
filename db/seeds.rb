# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Clearing database"

User.destroy_all
Project.destroy_all
Message.destroy_all
Proposal.destroy_all

puts "Creating User, Helper, Project, Proposal and Message"

user = User.new(email: "bob@lewagon.org", password: "123456",
                   firstname: "Robert", lastname: "Smith", typehelper: false)
user.save!

helper = User.new(email: "tony@lewagon.org", password: "123456",
                    firstname: "Tony", lastname: "Montana", typehelper: true,
                    certification: "Professional", experience: 10, profession: "contractor")
helper.save!

project1 = Project.new(title: "Kitchen counter renewal",
                          user_id: user.id,
                          description: "I want to remove my old kitchen counter and replace them with new ones.",
                          measurements: [{name: "counter", dimension: "13 by 15"}, {name: "kitchen", dimension: "20 by 20"}, {name: "counter height", dimension: "4ft"}])
project1.save!

proposal1 = Proposal.new(user_id: helper.id,
                        project_id: project1.id,
                        pitch: "Hello, I am available next week and could do this, I can do it for 500$"
                        )
proposal1.save!

message1 = Message.new(user_id: user.id,
                      proposal_id: proposal1.id,
                      content: "Hey that sounds fine for me, thank you!")
message1.save!

puts "Done"
