# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# data = [
#   { name: "都庁",
#     latitude: 35.6895014,
#     longitude: 139.6917337,
#     address: "日本、〒163-8001 東京都新宿区西新宿２丁目８−１" },
#   { name: "後楽園",
#     latitude: 35.7054551,
#     longitude: 139.7535553,
#     address: "日本、〒112-0004 東京都文京区後楽１丁目３" },
#   { name: "江ノ電自転車ニキ",
#     latitude: 35.3076198,
#     longitude: 139.4937805,
#     address: "日本、〒248-0033 神奈川県鎌倉市腰越２丁目１０−２５" }
# ]

# data.each do |point_attribute|
#   Point.create!(point_attribute)
# end

Admin.create!(
  email: "kaf@vwp.com",
  password: "kafka20"
)

herakurosu = User.find_or_create_by!(email: "herakurosu@example.com") do |user|
  user.name = "herakurosu"
  user.account = "herakurosu"
  user.password = "password"
  user.profile_image.attach(io: File.open('db/fixtures/herakurosu.png'), filename: 'herakurosu.png')
end

hisuizoroa = User.find_or_create_by!(email: "hisuizoroa@example.com") do |user|
  user.name = "hisuizoroa"
  user.account = "hisuizoroa"
  user.password = "password"
  user.profile_image.attach(io: File.open('db/fixtures/hisuizoroa.png'), filename: 'hisuizoroa.png')
end

husigidane = User.find_or_create_by!(email: "husigidane@example.com") do |user|
  user.name = "husigidane"
  user.account = "husigidane"
  user.password = "password"
  user.profile_image.attach(io: File.open('db/fixtures/husigidane.png'), filename: 'husigidane.png')
end

Post.find_or_create_by!(body: "kusa") do |post_data|
  post_data.lat = "35.7054551"
  post_data.lng = "139.6917337"
  post_data.images.attach(io: File.open('db/fixtures/nyaoha.jpg'), filename: 'nyaoha.jpg')
  post_data.user = herakurosu
end

Post.find_or_create_by!(body: "mizu") do |post_data|
  post_data.lat = "35.70152487037308"
  post_data.lng = "139.81708652504136"
  post_data.images.attach(io: File.open('db/fixtures/yadon.png'), filename: 'yadon.png')
  post_data.user = hisuizoroa
end

Post.find_or_create_by!(body: "ノーマル") do |post_data|
  post_data.lat = "35.80411786449981"
  post_data.lng = "139.98600131996324"
  post_data.images.attach([
    { io: File.open('db/fixtures/yokubarisu.png'), filename: 'yokubarisu.png'},
    { io: File.open('db/fixtures/イーブイ.png'), filename: 'イーブイ.png'}
  ])
  post_data.user = husigidane
end

# user_data = [
#   { name: "ニャオハ",
#     account: "nyaoha",
#     password: "masuka-nya",
#     email: "nyaoha@poke.com"},
#   { name: "ヒスイゾロア",
#     account: "hisuizoroa",
#     password: "zoroa-ku",
#     email: "hisuizoroa@poke.com"},
#   { name: "フシギダネ",
#     account: "husigidane",
#     password: "husigibana",
#     email: "husigidane@poke.com"}
#   ]

#   user_data.each do |user|
#     User.create!(user)
#   end

# post_data = [
#   { body: "むし",
#     lat: 35.7054551,
#     lng: 139.6917337,
#     address: "日本" },
#   { body: "みず",
#     lat: 35.7054551,
#     lng: 139.6917337,
#     address: "日本"},
#   { body: "ノーマル",
#     lat: 35.7054551,
#     lng: 139.6917337,
#     address: "日本"}
#   ]

#   post_data.each do |data|
#     Post.create!(data)
#   end