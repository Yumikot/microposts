# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loexitaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#User.create(name: "user05", email: "user05@example.com", password: "11111")
#User.create(name: "user06", email: "user06@example.com", password: "11111")
#User.create(name: "user07", email: "user07@example.com", password: "11111")
#User.create(name: "user08", email: "user08@example.com", password: "11111")
#User.create(name: "user09", email: "user09@example.com", password: "11111")
#User.create(name: "user10", email: "user10@example.com", password: "11111")
#User.create(name: "user11", email: "user11@example.com", password: "11111")
#User.create(name: "user12", email: "user12@example.com", password: "11111")
#User.create(name: "user13", email: "user13@example.com", password: "11111")
#User.create(name: "user14", email: "user14@example.com", password: "11111")
#User.create(name: "user15", email: "user15@example.com", password: "11111")
#User.create(name: "user16", email: "user16@example.com", password: "11111")
#User.create(name: "user17", email: "user17@example.com", password: "11111")
#User.create(name: "user18", email: "user18@example.com", password: "11111")
#User.create(name: "user19", email: "user19@example.com", password: "11111")
#User.create(name: "user20", email: "user20@example.com", password: "11111")
#User.create(name: "user21", email: "user21@example.com", password: "11111")
#User.create(name: "user22", email: "user22@example.com", password: "11111")
#User.create(name: "user23", email: "user23@example.com", password: "11111")
#User.create(name: "user24", email: "user24@example.com", password: "11111")
#User.create(name: "user25", email: "user25@example.com", password: "11111")
#User.create(name: "user26", email: "user26@example.com", password: "11111")
#User.create(name: "user27", email: "user27@example.com", password: "11111")
#User.create(name: "user28", email: "user28@example.com", password: "11111")
#User.create(name: "user29", email: "user29@example.com", password: "11111")
#User.create(name: "user30", email: "user30@example.com", password: "11111")
#
#
Relationship.create(follower_id: 1, followed_id: 2)
Relationship.create(follower_id: 1, followed_id: 3)
Relationship.create(follower_id: 1, followed_id: 4)
Relationship.create(follower_id: 1, followed_id: 5)
Relationship.create(follower_id: 1, followed_id: 6)
Relationship.create(follower_id: 1, followed_id: 7)
Relationship.create(follower_id: 1, followed_id: 8)
Relationship.create(follower_id: 1, followed_id: 9)


puts "seeds runninng..."

# ユーザー
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")
print "."
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
              email: email,
              password:              password,
              password_confirmation: password)
  print "."
end
puts "\n-> User_seeds OK!!"

# マイクロポスト
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
  print "."
end
puts "\n-> Micropost_seeds OK!!"

# リレーションシップ
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed); print "." }
puts "\n-> Following_seeds OK!!"
followers.each { |follower| follower.follow(user); print "." }
puts "\n-> Follower_seeds OK!!"

puts "\n=> All_seeds OK!!"