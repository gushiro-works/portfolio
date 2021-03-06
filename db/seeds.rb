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


User.find(1).measurements.create!(event: "腹筋何回やった？", unit: "回")
User.find(2).measurements.create!(event: "小説何文字書いた？", unit: "文字")
User.find(3).measurements.create!(event: "プログラミング何時間勉強した？", unit: "時間")
User.find(4).measurements.create!(event: "本何ページ読んだ？", unit: "ページ")
User.find(5).measurements.create!(event: "（高校生限定）何時間勉強した？", unit: "時間")


random = Random.new
users.each { |user|
  level = random.rand(3)
  10.times do |n|
    user.records.create!(measurement_id: 1, record_value: (10*level+random.rand(14)), created_at: (24*(n-1)).hours.ago)
    user.records.create!(measurement_id: 2, record_value: (1000*level+random.rand(1400)), created_at: (24*(n-1)).hours.ago)
    user.records.create!(measurement_id: 3, record_value: (4*level+random.rand(4)), created_at: (24*(n-1)).hours.ago)
  end
}


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


users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

=end