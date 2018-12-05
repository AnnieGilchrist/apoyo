# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
User.destroy_all
Business.destroy_all
Charity.destroy_all


puts "Creating charities..."

oxfam = Charity.create(name: 'Oxfam', category: 'humanitarian', description: 'Oxfam is a confederation of 20 independent charitable organizations focusing on the alleviation of global poverty, founded in 1942 and led by Oxfam International. It is a major nonprofit group with an extensive collection of operations.', address: 'London' , website: 'www.oxfam.com')


cancer_research = Charity.create(name: 'Cancer Research UK', category: 'healthcare', description: 'Cancer Research UK is a cancer research and awareness charity in the United Kingdom and Isle of Man, formed on 4 February 2002 by the merger of The Cancer Research Campaign and the Imperial Cancer Research Fund. Its aim is to reduce the number of deaths from cancer.', address: 'London' , website: 'www.cancerresearch.uk')

heifer = Charity.create(name: 'Heifer International', category: 'humanitarian', description: 'Oxfam is a confederation of 20 independent charitable organizations focusing on the alleviation of global poverty, founded in 1942 and led by Oxfam International. It is a major nonprofit group with an extensive collection of operations.', address: 'New York' , website: 'www.heifer.com')



puts "Creating businesses..."

freshfields = Business.create(name: 'Freshfields Bruckhaus Deringer LLP', description: 'Freshfields Bruckhaus Deringer LLP, considered to have been founded in 1743, is a multinational law firm headquartered in London and a member of the Magic Circle of elite British law firms.', address: 'London', website: 'www.freshfields.org', charity_preferences: 'healthcare', services_offered: 'web design')

disney = Business.create(name: 'The Walt Disney Company', description: 'The Walt Disney Company, commonly known as Walt Disney or simply Disney, is an American diversified multinational mass media and entertainment conglomerate headquartered at the Walt Disney Studios in Burbank, California.', address: 'Burbank', website: 'www.disney.com', charity_preferences: 'humanitarian', services_offered: 'donation'
  )

lewagon = Business.create(name: 'Le Wagon', description: "Le Wagon is Europe's best coding bootcamp for creative people & entrepreneurs. Learn to code in 9 weeks with our fullstack coding bootcamp.", address: 'Paris', website: 'www.lewagon.com', charity_preferences: 'education', services_offered: 'education'
  )

puts "Creating users..."
ian = User.new(email: 'ian@mail.com', password: '12345678')
ian.organisation = oxfam
ian.save

annie = User.new(email: 'annie@mail.com', password: '12345678')
annie.organisation = freshfields
annie.save

xun = User.new(email: 'xun@mail.com', password: '12345678')
xun.organisation = cancer_research
xun.save


puts "Creating missions..."

10.times do
  mission = Mission.new(name: Faker::Job.field, description: Faker::BackToTheFuture.quote)
  mission.charity = Charity.all.sample
  mission.save
end

puts "Creating partnerships..."
(1..5).to_a.each do |number|
  details = Faker::Community.quotes
  partnership = Partnership.new(details: details)
  partnership.business = Business.all.sample
  partnership.mission = Mission.all.sample
  partnership.save
end

puts "All created successfully."

