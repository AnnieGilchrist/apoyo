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

puts "Creating charities..."

oxfam = Charity.create(name: 'Oxfam', category: 'humanitarian', description: 'Oxfam is a confederation of 20 independent charitable organizations focusing on the alleviation of global poverty, founded in 1942 and led by Oxfam International. It is a major nonprofit group with an extensive collection of operations.', address: 'London' , website: 'www.oxfam.com')
  url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544183308/PYdTCugb_400x400.jpg'
  oxfam.remote_logo_url = url
  oxfam.save!

cancer_research = Charity.create(name: 'Cancer Research UK', category: 'healthcare', description: 'Cancer Research UK is a cancer research and awareness charity in the United Kingdom and Isle of Man, formed on 4 February 2002 by the merger of The Cancer Research Campaign and the Imperial Cancer Research Fund. Its aim is to reduce the number of deaths from cancer.', address: 'London' , website: 'www.cancerresearch.uk')
  url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544179228/ujdbe4avxinb5dzprmns.jpg'
  cancer_research.remote_logo_url = url
  cancer_research.save!

heifer = Charity.create(name: 'Heifer International', category: 'humanitarian', description: 'Heifer International is a global nonprofit working to eradicate poverty and hunger through sustainable, values-based holistic community development. Heifer distributes animals, along with agricultural and values-based training, to families in need around the world as a means of providing self-sufficiency.', address: 'Little Rock, Arkansas' , website: 'www.heifer.com')
  url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544183314/unnamed.jpg'
  heifer.remote_logo_url = url
  heifer.save!

gates_foundation = Charity.create(name: 'Bill & Melinda Gates Foundation', category: 'humanitarian', description: "Bill & Melinda Gates Foundation, previously branded as the 'William H. Gates Foundation', is a private foundation founded by Bill and Melinda Gates. It was launched in 2000, and is said to be the largest private foundation in the United States, holding $50.7 billion in assets.", address: 'Seattle, Washington' , website: 'https://www.gatesfoundation.org')
  url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544183303/1752x1168.jpg'
  gates_foundation.remote_logo_url = url
  gates_foundation.save!

wwf = Charity.create(name: 'World Wildlife Fund for Nature', category: 'environment', description: 'The World Wide Fund for Nature is an international non-governmental organization founded in 1961, working in the field of the wilderness preservation, and the reduction of human impact on the environment. It was formerly named the World Wildlife Fund, which remains its official name in Canada and the United States.', address: 'Gland, Switzerland' , website: 'https://www.worldwildlife.org')
  url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544183116/1200px-WWF_logo.svg.png'
  wwf.remote_logo_url = url
  wwf.save!


puts "Creating businesses..."

freshfields = Business.new(name: 'Freshfields Bruckhaus Deringer LLP', description: 'Freshfields Bruckhaus Deringer LLP, considered to have been founded in 1743, is a multinational law firm headquartered in London and a member of the Magic Circle of elite British law firms.', address: 'London', website: 'www.freshfields.org', charity_preferences: 'healthcare', services_offered: 'web design')
  url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544102858/tfpxjmf7zctn7qu3dhly.png'
  freshfields.remote_logo_url = url
  freshfields.save!

disney = Business.new(name: 'The Walt Disney Company', description: 'The Walt Disney Company, commonly known as Walt Disney or simply Disney, is an American diversified multinational mass media and entertainment conglomerate headquartered at the Walt Disney Studios in Burbank, California.', address: 'Burbank', website: 'www.disney.com', charity_preferences: 'humanitarian', services_offered: 'donation'
  )
  url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544193460/Disney-Logo.png'
  disney.remote_logo_url = url
  disney.save!


lewagon = Business.new(name: 'Le Wagon', description: "Le Wagon is Europe's best coding bootcamp for creative people & entrepreneurs. Learn to code in 9 weeks with our fullstack coding bootcamp.", address: 'Paris', website: 'www.lewagon.com', charity_preferences: 'education', services_offered: 'education'
  )
  url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544193521/lewagon.png'
  lewagon.remote_logo_url = url
  lewagon.save!

puts "Creating users..."
annie = User.new(email: 'annie@mail.com', password: '12345678')
annie.organisation = freshfields
annie.save!

heifer_user = User.new(email: 'heifer_user@mail.com', password: '12345678')
heifer_user.organisation = heifer
heifer_user.save!

gates_user = User.new(email: 'gates_user@mail.com', password: '12345678')
gates_user.organisation = gates_foundation
gates_user.save!

wwf_user = User.new(email: 'wwf_user@mail.com', password: '12345678')
wwf_user.organisation = wwf
wwf_user.save!

disney_user = User.new(email: 'disney_user@mail.com', password: '12345678')
disney_user.organisation = disney
disney_user.save!

lewagon_user = User.new(email: 'lewagon_user@mail.com', password: '12345678')
lewagon_user.organisation = lewagon
lewagon_user.save!

ian = User.new(email: 'ian@mail.com', password: '12345678')
ian.organisation = oxfam
ian.save!


xun = User.new(email: 'xun@mail.com', password: '12345678')
xun.organisation = cancer_research
xun.save!


puts "Creating missions..."

  office_volunteers = Mission.new(name: 'Volunteer in our offices', description: 'We’re always looking for people to help in our offices, whether you want to develop office admin skills, or share your expertise. We have different kinds of office roles available, depending on your level of experience and the time-commitment you are able to offer.', duration: 'Just two hours a week would make a difference!', charity_id: cancer_research.id)
    url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544183921/Ck_group.jpg'
    office_volunteers.remote_image_url = url
    office_volunteers.save

  grow = Mission.new(name: 'GROW', description: "Almost a billion of us go to bed hungry every night. Not because there isn't enough, but because of the deep injustice in the way the system works. Together, we can win the fight against hunger. Find out how and join the Grow campaign.", duration: 'indefinite', charity_id: oxfam.id)
    url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544191355/grow-main-460_4.jpg'
    grow.remote_image_url = url
    grow.save


  crisis = Mission.new(name: 'Rights in Crisis', description: 'Globally we are witnessing a rise in the scale and frequency of humanitarian crises and their impacts on vulnerable people. The gap is widening between humanitarian needs and the ability or willingness of governments and international humanitarian actors, including NGOs like Oxfam, to meet them.', duration: "Irregular time depending on the world's crises", charity_id: heifer.id)
    url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544191361/conflict-emergencies-488_4.jpg'
    crisis.remote_image_url = url
    crisis.save

  even = Mission.new(name: 'Even it up', description: 'Did you know that 1% now own more than the rest of us combined?  Inequality is growing around the world. Every year, the gap between rich and poor gets even wider. Far from trickling down, income and wealth are being sucked upwards at an alarming rate. The very design of our economies have taken us to this extreme and unjust point, with rules  that benefit wealthy corporations and elites at the expense of everyone else.', charity_id: gates_foundation.id)
    url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544191375/paraisopolis2008-700.jpg'
    even.remote_image_url = url
    even.save

  women = Mission.new(name: 'Violence against women and girls: enough is enough', description: 'Did you know that at least one in three women (35 per cent) will experience some form of violence during their lifetime - more than one billion women worldwide? Violence against women and girls is a hidden global crisis which knows no boundaries of geography or culture. But, marginalized women, such as poor women and girls, are most likely to experience it, most often at the hands of their husbands or partners.', duration: 'An ongoing battle', charity_id: oxfam.id)
    url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544191368/india_girl.jpg'
    women.remote_image_url = url
    women.save

  ivory = Mission.new(name: "Closing Asia's Ivory Markets", description: 'Illegal killing of elephants for ivory decimates global populations. Estimates indicate that each year poachers slaughter close to 20,000 elephants, mostly for their tusks. Fueling this rampant poaching is a steady consumer demand for ivory. Overall, we see demand increasing in East Asian and Southeast Asian markets, with the greatest demand in China, Hong Kong, Singapore, and Thailand. WWF is working to shut down the illegal markets in Thailand, and helped end the legal ivory trade in China. By tackling these markets now as part of a pan-Asian approach, WWF aims to leverage China’s recent actions to ban the ivory trade to prevent further displacement of the current China ivory trade to nearby countries.', duration: 'All the business hours you can give', charity_id: wwf.id)
    url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544191751/elephants-in-africa-humane-society-announcement-on-ivory-trade.jpg'
    ivory.remote_image_url = url
    ivory.save

  deforestation = Mission.new(name: "Reducing Emissions from Deforestation", description: "Forests are nature’s greatest technology for combating climate change: they naturally absorb carbon dioxide (CO2), reducing the amount of this heat-trapping gas in our atmosphere. When forests are not managed responsibly, they release large quantities of C02 into the atmosphere. Deforestation and degradation are the largest sources of C02 emissions after the burning of fossil fuels. Scientists estimate up to 0.13 of global carbon emissions come from deforestation.", duration: "We hope you'll pledge to use sustainable paper practices and ask your business contacts to do the same", charity_id: wwf.id)
    url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544192407/deforestation.jpg'
    deforestation.remote_image_url = url
    deforestation.save

