# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
GossipTag.destroy_all
Comment.destroy_all
SubComment.destroy_all
Like.destroy_all

10.times do
  City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph, age: Faker::Number.between(from: 18, to: 120), email: Faker::Internet.email, city: City.all.sample)
end

20.times do
  Gossip.create(title: Faker::Book.title, content: Faker::TvShows::SouthPark.quote, user: User.all.sample)
end

10.times do
  Tag.create(title: Faker::Book.genre)
end

Gossip.all.each do |gossip|
  rand(1..4).times do
    GossipTag.create(tag: Tag.all.sample, gossip: gossip)
  end
end

5.times do
  private_message = PrivateMessage.create(sender: User.all.sample, recipient: User.all.sample,content: Faker::Quote.most_interesting_man_in_the_world)
  rand(1..6).times do
    private_message = PrivateMessage.update(recipient: User.all.sample)
  end
end

20.times do
  Comment.create(content: Faker::ChuckNorris.fact, user: User.all.sample, gossip: Gossip.all.sample)
end

20.times do
  Like.create(likable: [true, false].sample ? Gossip.all.sample : Comment.all.sample, user: User.all.sample)
end

30.times do
  SubComment.create(content: Faker::ChuckNorris.fact, user: User.all.sample, comment: Comment.all.sample)
end
