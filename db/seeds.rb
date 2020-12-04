# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

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
file = URI.open('https://cdn.extra.ie/wp-content/uploads/2020/03/31083633/PRI148024672.jpg')
user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user.save!

user2 = User.new(email: "anon@lewagon.org", password: "123456",
                   firstname: "Anony", lastname: "Mous", typehelper: false)
user2.save!

user3 = User.new(email: "emilie@lewagon.org", password: "123456",
                   firstname: "Emilie", lastname: "Something", typehelper: false)
file = URI.open('http://images2.fanpop.com/image/photos/13500000/peachy-princess-peach-13537344-600-1143.jpg')
user3.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user3.save!

helper = User.new(email: "mario@lewagon.org", password: "123456",
                    firstname: "Mario", lastname: "Tremblay", typehelper: true,
                    certification: "Professional", experience: 10, profession: "plumber")
file = URI.open('https://media.istockphoto.com/photos/smiling-male-plumber-with-pipe-wrench-standing-arms-crossed-picture-id1048532228?k=6&m=1048532228&s=612x612&w=0&h=tFB38ToGIK1w5thraooHrmNRrAp6BP4Lq5C_shFUNSc=')
helper.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
helper.save!

helper2 = User.new(email: "mike@lewagon.org", password: "123456",
                    firstname: "Mike", lastname: "Tyssonier", typehelper: true,
                    certification: "Apprentice", experience: 2, profession: "demolisher")
helper2.save!


project1 = Project.new(title: "Living room renewal",
                          user_id: user.id,
                          description: "I want my living room to be brand new!",
                          measurements: [{name: "Couch", dimension: "13ft by 15ft"}, {name: "TV stand", dimension: "10ft by 12ft"}, {name: "Table", dimension: "15ft by 15ft"}],
                          address: "5330 rue Chambord, Montreal, Qc, Canada")
file = URI.open('https://photos.duproprio.com/photos/public/for_sale/202011/939647/condo-rosemont-petite-patrie-1600-11827532.jpg')
file1 = URI.open('https://photos.duproprio.com/photos/public/for_sale/202011/939647/condo-rosemont-petite-patrie-1600-11827528.jpg')
project1.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project1.photos.attach(io: file1, filename: 'nes.png', content_type: 'image/png')
project1.save!

project2 = Project.new(title: "New kitchen, new life!",
                          user_id: user.id,
                          description: "I want to remove those ugly green faience and change the cupboards",
                          measurements: [{name: "Counter", dimension: "25ft by 2ft"}, {name: "Table", dimension: "5ft by 2ft"}, {name: "Black shelf", dimension: "4ft"}],
                          address: "5320 rue Lanaudiere, Montreal, Qc, Canada")
file = URI.open('https://photos.duproprio.com/photos/public/for_sale/202011/939599/condo-plateau-mont-royal-1600-11820645.jpg')
file1 = URI.open('https://photos.duproprio.com/photos/public/for_sale/202011/939599/condo-plateau-mont-royal-1600-11820644.jpg')
file2 = URI.open('https://photos.duproprio.com/photos/public/for_sale/202011/939599/condo-plateau-mont-royal-1600-11820646.jpg')
project2.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project2.photos.attach(io: file1, filename: 'nes.png', content_type: 'image/png')
project2.photos.attach(io: file2, filename: 'nes.png', content_type: 'image/png')
project2.save!

project3 = Project.new(title: "Paint the wall!",
                          user_id: user2.id,
                          description: "Its so white everywhere, I feel like i'm in an hospital! Please bring color to my appartement",
                          measurements: [{name: "living room", dimension: "25ft by 10ft"}],
                          address: "498 rue de la tourelle, Quebec, Qc, Canada")
file = URI.open('https://photos.duproprio.com/photos/public/for_sale/202011/939234/condo-montreal-centre-ville-ville-marie-1600-11819431.jpg')
file1 = URI.open('https://photos.duproprio.com/photos/public/for_sale/202011/939234/condo-montreal-centre-ville-ville-marie-1600-11819433.jpg')
project3.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project3.photos.attach(io: file1, filename: 'nes.png', content_type: 'image/png')
project3.save!

project4 = Project.new(title: "Have a bigger kitchen",
                          user_id: user2.id,
                          description: "I want to remove my kitchen counter and extend my kitchen so I have more space to cook.",
                          measurements: [{name: "counter", dimension: "6ft by 2ft"}, {name: "kitchen", dimension: "10 by 2"}],
                          address: "345 rue lavigueur, Quebec, Qc, Canada")
file = URI.open('https://photos.duproprio.com/photos/public/for_sale/202009/924734/condo-montreal-nord-1600-11533480.jpg')
file1 = URI.open('https://photos.duproprio.com/photos/public/for_sale/202009/924734/condo-montreal-nord-1600-11533474.jpg')
file2 = URI.open('https://photos.duproprio.com/photos/public/for_sale/202009/924734/condo-montreal-nord-1600-11533481.jpg')
project4.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project4.photos.attach(io: file1, filename: 'nes.png', content_type: 'image/png')
project4.photos.attach(io: file2, filename: 'nes.png', content_type: 'image/png')
project4.save!

project5 = Project.new(title: "Renovate my bathroom",
                          user_id: user3.id,
                          description: "I want to the floor tiles and remove the stair for the bath",
                          measurements: [{name: "bath", dimension: "2ft by 1ft"}, {name: "length", dimension: "10"}, {name: "width", dimension: "4"}],
                          address: "249 rue rimbaud, Saguenay, Qc, Canada")
file = URI.open('https://photos.duproprio.com/photos/public/for_sale/202011/934560/condo-rosemont-petite-patrie-1600-11768378.jpg')
file1 = URI.open('https://photos.duproprio.com/photos/public/for_sale/202011/934560/condo-rosemont-petite-patrie-1600-11768379.jpg')
project5.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
project5.photos.attach(io: file1, filename: 'nes.png', content_type: 'image/png')
project5.save!


proposal1 = Proposal.new(user_id: helper2.id,
                        project_id: project1.id,
                        pitch: "Hello, I am available next week and could do thith, I can do it for 500$"
                        )
proposal1.save!

proposal2 = Proposal.new(user_id: helper.id,
                        project_id: project2.id,
                        pitch: "Hello, I am available next week and could do this, I can do it for 500$, please clean everything before"
                        )
proposal2.save!

message2 = Message.new(user_id: user.id,
                      proposal_id: proposal2.id,
                      content: "Hello, 500 is fine for me. I will try to clean it as much as possible")
message2.save!


tags = ["Electrical", "Plumbing", "Renovation", "Masonery", "Roofing", "Demolition", "Outdoor", "Painting"]

tags.each do |tag|
  Tag.create!(name: tag)
end

project_tag = ProjectTag.new(project: project1, tag: Tag.all[2])
project_tag.save!
project_tag2 = ProjectTag.new(project: project2, tag: Tag.all[2])
project_tag2.save!
project_tag3 = ProjectTag.new(project: project2, tag: Tag.all[5])
project_tag3.save!
project_tag4 = ProjectTag.new(project: project3, tag: Tag.all[7])
project_tag4.save!
project_tag5 = ProjectTag.new(project: project4, tag: Tag.all[3])
project_tag5.save!
project_tag6 = ProjectTag.new(project: project4, tag: Tag.all[5])
project_tag6.save!
project_tag7 = ProjectTag.new(project: project5, tag: Tag.all[3])
project_tag7.save!
project_tag8 = ProjectTag.new(project: project5, tag: Tag.all[5])
project_tag8.save!

Project.reindex

puts "Done"
