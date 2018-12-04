# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Business.destroy_all
Charity.destroy_all

oxfam = Charity.create(name: 'Oxfam', category: 'Humanitarian', description: 'Oxfam is a confederation of 20 independent charitable organizations focusing on the alleviation of global poverty, founded in 1942 and led by Oxfam International. It is a major nonprofit group with an extensive collection of operations.')

freshfields = Business.create(name: 'Freshfields Bruckhaus Deringer LLP', description: 'Freshfields Bruckhaus Deringer LLP, considered to have been founded in 1743, is a multinational law firm headquartered in London and a member of the Magic Circle of elite British law firms.')

cancer_research = Charity.create(name: 'Cancer Research UK', category: 'Healthcare', description: 'Cancer Research UK is a cancer research and awareness charity in the United Kingdom and Isle of Man, formed on 4 February 2002 by the merger of The Cancer Research Campaign and the Imperial Cancer Research Fund. Its aim is to reduce the number of deaths from cancer.')

ian = User.new(email: 'ian@mail.com', password: '12345678')
ian.organisation = oxfam
ian.save

annie = User.new(email: 'annie@mail.com', password: '12345678')
annie.organisation = freshfields
annie.save

xun = User.new(email: 'xun@mail.com', password: '12345678')
xun.organisation = cancer_research
xun.save

