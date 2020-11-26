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
Tag.destroy_all
ProjectTag.destroy_all


puts "Filling database"

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
                          measurements: [{name: "counter", dimension: "13 by 15"}, {name: "kitchen", dimension: "20 by 20"}, {name: "counter height", dimension: "4ft"}],
                          address: "5330 rue Chambord H2J3N5 Quebec Canada")
project1.save!

project2 = Project.new(title: "Build a torture chamber",
                          user_id: user.id,
                          description: "My wife recently saw fifty shades of grey and now wants to turn my office into a freaky sex room.",
                          measurements: [{name: "Room", dimension: "25 by 25"}, {name: "Sex swing", dimension: "5 foot long"}, {name: "Sex toy shelf", dimension: "4ft"}],
                          address: "5350 rue Lanaudiere H2J3N5 Quebec Canada")
project2.save!

proposal1 = Proposal.new(user_id: helper.id,
                        project_id: project1.id,
                        pitch: "Hello, I am available next week and could do this, I can do it for 500$"
                        )
proposal1.save!

proposal2 = Proposal.new(user_id: helper.id,
                        project_id: project2.id,
                        pitch: "Hello, I am available next week and could do this, I can do it for 500$, please clean everything before"
                        )
proposal2.save!

message2 = Message.new(user_id: user.id,
                      proposal_id: proposal2.id,
                      content: "My wife wants to know if you can work in a leather suit?")
message2.save!

message3 = Message.new(user_id: helper.id,
                      proposal_id: proposal2.id,
                      content: "I'm having serious second thoughts about working at your place...")
message3.save!

tags = ["Electrical", "Plumbing", "Renovation", "Masonery", "Roofing", "Demolition", "Outdoor"]

tags.each do |tag|
  Tag.create!(name: tag)
end

project_tag = ProjectTag.new(project: project2, tag: Tag.first)
project_tag.save!

puts "Done"
