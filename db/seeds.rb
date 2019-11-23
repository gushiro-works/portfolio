User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name     = Faker::Name.name
  email    = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end


Measurement.create!(event: "腹筋何回やった？", unit: "回")
Measurement.create!(event: "小説何文字書いた？", unit: "文字")
Measurement.create!(event: "何時間勉強した？", unit: "時間")
#User.find(4).measurements.create!(event: "？", unit: "kg")
#User.find(5).measurements.create!(event: "腹筋何回やった？", unit: "回")
#User.find(6).measurements.create!(event: "小説何文字書いた？", unit: "文字")

#100.times do
#  random = rand(3)
#  Record.create!(user_id: random*3, measurement_id: random, record_value: random*20)
#end



=begin
firstUser = User.find(1)
firstUser.Measurement.create!(event: "今日腹筋何回やった？", unit: "回", type: "no_limit_N")
firstUser.Measurement.create!(event: "今日の体重は？", unit: "kg", type: "no_limit_N")
firstUser.Measurement.create!(event: "タバコを何本吸った？", unit: "kg", type: "no_limit_N")
firstUser.Measurement.create!(event: "部屋の掃除をした？", unit: "", type: "yes_or_no")
firstUser.Measurement.create!(event: "何時間勉強した？", unit: "時間", type: "no_limit_N")

  

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.measurements.create!(event: content) }
end
=end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

