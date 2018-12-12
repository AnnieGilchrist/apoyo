User.destroy_all
Business.destroy_all
Charity.destroy_all
Follow.destroy_all

puts "Creating charities..."

oxfam = Charity.create(name: 'Oxfam', category: 'humanitarian', description: 'Oxfam is a confederation of 20 independent charitable organizations focusing on the alleviation of global poverty, founded in 1942 and led by Oxfam International. It is a major nonprofit group with an extensive collection of operations.', address: 'John Smith Drive, Oxford, OX4 2JY, UK', location: 'Oxford, UK' , website: 'https://www.oxfam.org/en')
  url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544183308/PYdTCugb_400x400.jpg'
  oxfam.remote_logo_url = url
  oxfam.save!

cancer_research = Charity.create(name: 'Cancer Research UK', category: 'healthcare', description: 'Cancer Research UK is a cancer research and awareness charity in the United Kingdom and Isle of Man, formed on 4 February 2002 by the merger of The Cancer Research Campaign and the Imperial Cancer Research Fund. Its aim is to reduce the number of deaths from cancer.', address: '407 St John Street, London EC1V 4AD, UK', location: 'London, UK', website: 'https://www.cancerresearchuk.org')
  url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544179228/ujdbe4avxinb5dzprmns.jpg'
  cancer_research.remote_logo_url = url
  cancer_research.save!

heifer = Charity.create(name: 'Heifer International', category: 'environment', description: 'Heifer International is a global nonprofit working to eradicate poverty and hunger through sustainable, values-based holistic community development. Heifer distributes animals, along with agricultural and values-based training, to families in need around the world as a means of providing self-sufficiency.', address: '1 World Avenue, Little Rock, AR 72202, USA', location: 'Little Rock, USA', website: 'https://www.heifer.org/')
  url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544183314/unnamed.jpg'
  heifer.remote_logo_url = url
  heifer.save!

gates_foundation = Charity.create(name: 'Bill & Melinda Gates Foundation', category: 'humanitarian', description: "Bill & Melinda Gates Foundation, previously branded as the 'William H. Gates Foundation', is a private foundation founded by Bill and Melinda Gates. It was launched in 2000, and is said to be the largest private foundation in the United States, holding $50.7 billion in assets.", address: 'Bill & Melinda Gates Foundation, 5th Avenue North, Washington, 98109, USA', location: 'Seattle, USA', website: 'https://www.gatesfoundation.org')
  url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544183303/1752x1168.jpg'
  gates_foundation.remote_logo_url = url
  gates_foundation.save!

wwf = Charity.create(name: 'World Wildlife Fund for Nature', category: 'environment', description: 'The World Wide Fund for Nature is an international non-governmental organization founded in 1961, working in the field of the wilderness preservation, and the reduction of human impact on the environment. It was formerly named the World Wildlife Fund, which remains its official name in Canada and the United States.', address: 'Av. du Mont-Blanc 1196, Gland, Switzerland', location: 'Gland, Switzerland', website: 'https://www.worldwildlife.org')
  url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544183116/1200px-WWF_logo.svg.png'
  wwf.remote_logo_url = url
  wwf.save!

wildlife = Charity.create(name: 'Defenders of Wildlife', category: 'environment', description: 'Defenders of Wildlife is a 501 non-profit conservation organization based in the United States. Its mission is to protect all native animals and plants throughout North America in their natural communities.', address: 'Defenders of Wildlife, 1130, N Street Northwest, Dupont Circle, Washington, District of Columbia, 20037, USA', location: 'Washington, D.C., United States', website: 'https://defenders.org/')
  url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544550005/wildlife.jpg'
  wildlife.remote_logo_url = url
  wildlife.save!

sierra = Charity.create(name: 'Sierra Club', category: 'environment', description: 'The Sierra Club is the most enduring and influential grassroots environmental organization in the United States. We amplify the power of our 3.5+ million members and supporters to defend everyone’s right to a healthy world.', address: '1300 Oakland, CA 94612 USA', location: 'Oakland, California, United States', website: 'https://www.sierraclub.org/home')
  url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544616812/sierra-club.jpg'
  sierra.remote_logo_url = url
  sierra.save!

earthwatch = Charity.create(name: 'Earthwatch Institute', category: 'environment', description: 'Our vision is a world in which we live within our means and in balance with nature. We bring individuals from all walks of life together with world-class scientists to work for the good of the planet. The Earthwatch community continues to grow rapidly, with participation from members of the general public we call "citizen scientists," to corporate employees, to educators and students. All bring their knowledge, passion, and experience to support our work, improve scientific understanding, and inspire change across all touch-points in their lives.', address: '1380, Soldiers Field Road, North Brighton, Allston, Boston, Suffolk County, Massachusetts, 02135, USA', location: 'Boston, Massachusetts, United States', website: 'https://earthwatch.org/')
  url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544626730/earthwatch-banner.jpg'
  earthwatch.remote_logo_url = url
  earthwatch.save!


puts "Creating businesses..."

freshfields = Business.new(name: 'Freshfields Bruckhaus Deringer LLP', description: 'Freshfields Bruckhaus Deringer LLP, considered to have been founded in 1743, is a multinational law firm headquartered in London and a member of the Magic Circle of elite British law firms.', address: '65 Fleet St, London EC4Y 1HT, UK', location: 'London, UK', website: 'www.freshfields.org', charity_preferences: 'healthcare', services_offered: 'legal')
  url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544102858/tfpxjmf7zctn7qu3dhly.png'
  freshfields.remote_logo_url = url
  freshfields.save!

disney = Business.new(name: 'The Walt Disney Company', description: 'The Walt Disney Company, commonly known as Walt Disney or simply Disney, is an American diversified multinational mass media and entertainment conglomerate headquartered at the Walt Disney Studios in Burbank, California.', address: 'Walt Disney Studios, Burbank, California, 91506, USA', location: 'California, USA', website: 'www.disney.com', charity_preferences: 'humanitarian', services_offered: 'donation'
  )
  url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544193460/Disney-Logo.png'
  disney.remote_logo_url = url
  disney.save!

lewagon = Business.new(name: 'Le Wagon', description: "Le Wagon is Europe's best coding bootcamp for creative people & entrepreneurs. Learn to code in 9 weeks with our fullstack coding bootcamp.", address: "Carrer d'en Grassot, 101, 08025 Barcelona", location: 'Barcelona, Spain', website: 'www.lewagon.com', charity_preferences: 'education', services_offered: 'web design'
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

wildlife_user = User.new(email: 'wildlife_user@mail.com', password: '12345678')
wildlife_user.organisation = wildlife
wildlife_user.save!

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
    url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544543475/wheat.jpg'
    grow.remote_image_url = url
    grow.save


  crisis = Mission.new(name: 'Rights in Crisis', description: "Globally we are witnessing a rise in the scale and frequency of humanitarian crises and their impacts on vulnerable people. The gap is widening between humanitarian needs and the ability or willingness of governments and international humanitarian actors, including NGOs like Oxfam, to meet them. We need your organization's strength to influence governments to behave moraly", duration: "Irregular time depending on the world's crises", charity_id: oxfam.id)
    url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544543611/crisis.jpg'
    crisis.remote_image_url = url
    crisis.save

  even = Mission.new(name: 'Even it up', description: "Did you know that 1% now own more than the rest of us combined?  Inequality is growing around the world. Every year, the gap between rich and poor gets even wider. Far from trickling down, income and wealth are being sucked upwards at an alarming rate. The very design of our economies have taken us to this extreme and unjust point, with rules  that benefit wealthy corporations and elites at the expense of everyone else. We call on you to be a change in business's perspecive and realize that individual growth is helpful to all, while corporate growth is not.", charity_id: oxfam.id)
    url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544543754/unequal.jpg'
    even.remote_image_url = url
    even.save

  women = Mission.new(name: 'Violence against women and girls: enough is enough', description: 'Did you know that at least one in three women (35 per cent) will experience some form of violence during their lifetime - more than one billion women worldwide? Violence against women and girls is a hidden global crisis which knows no boundaries of geography or culture. But, marginalized women, such as poor women and girls, are most likely to experience it, most often at the hands of their husbands or partners. Help defend those that need it most!', duration: 'An ongoing battle', charity_id: oxfam.id)
    url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544544049/girl.jpg'
    women.remote_image_url = url
    women.save

  ivory = Mission.new(name: "Closing Asia's Ivory Markets", description: "We need companies like you to work against industries that participate or benefit in the needless slaughter of the world's elephants. Illegal killing of elephants for ivory decimates global populations. Estimates indicate that each year poachers slaughter close to 20,000 elephants, mostly for their tusks. Fueling this rampant poaching is a steady consumer demand for ivory. Overall, we see demand increasing in East Asian and Southeast Asian markets, with the greatest demand in China, Hong Kong, Singapore, and Thailand. WWF is working to shut down the illegal markets in Thailand, and helped end the legal ivory trade in China. By tackling these markets now as part of a pan-Asian approach, WWF aims to leverage China’s recent actions to ban the ivory trade to prevent further displacement of the current China ivory trade to nearby countries.", duration: 'All the business hours you can give', charity_id: wwf.id)
    url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544191751/elephants-in-africa-humane-society-announcement-on-ivory-trade.jpg'
    ivory.remote_image_url = url
    ivory.save

  deforestation = Mission.new(name: "Reducing Emissions from Deforestation", description: "We need a pledge from forward thinking comapanies, like yours, to cut down on their paper usage. Forests are nature’s greatest technology for combating climate change: they naturally absorb carbon dioxide (CO2), reducing the amount of this heat-trapping gas in our atmosphere. When forests are not managed responsibly, they release large quantities of C02 into the atmosphere. Deforestation and degradation are the largest sources of C02 emissions after the burning of fossil fuels. Scientists estimate up to 0.13 of global carbon emissions come from deforestation.", duration: "We hope you'll pledge to use sustainable paper practices and ask your business contacts to do the same", charity_id: wwf.id)
    url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544192407/deforestation.jpg'
    deforestation.remote_image_url = url
    deforestation.save

  agriculture = Mission.new(name: "Agricultural Development", description: "Our goal is to improve the well-being of millions of poor farm families in Sub-Saharan Africa and South Asia, allowing them to live more productive and rewarding lives through raising incomes, improving nutrition and empowering women. We believe that the best way to do this is by helping smallholders transition into farming as a business. To that end, we invest in three strategic areas: research and development, agricultural policies, and access and market systems. We coordinate our efforts across these areas to build robust systems that address the needs of farm families.", duration: "24 months", charity_id: gates_foundation.id)
    url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544544523/farmer.jpg'
    agriculture.remote_image_url = url
    agriculture.save

  financial_services = Mission.new(name: "Financial Services for the Poor", description: "Share your knowledge! The Bill & Melinda Gates Foundation’s Financial Services for the Poor program works to broaden the reach of low-cost digital financial services for the poor. Our strategy is aimed at supporting what we and our partners believe are the most catalytic approaches to financial inclusion: helping to drive the development of digital payment systems that can help spread use of digital financial services quickly, advancing gender equality to ensure women share in the benefits of financial inclusion, and supporting the development of national and regional strategies that accelerate progress for the poor and provide exemplar models. To achieve these objectives, we work with partners around the world to align on common principles for digital financial inclusion and support policymakers as they work to develop policies and regulations that facilitate growth in digital financial services and provide oversight and accountability. We also invest in national financial inclusion initiatives where the largest number of people living in poverty stand to benefit from digital financial services, including: Bangladesh, India, Nigeria, Pakistan, Indonesia, and East Africa.", duration: "36 months", charity_id: gates_foundation.id)
    url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544545120/education.jpg'
    financial_services.remote_image_url = url
    financial_services.save

  graduation = Mission.new(name: "Postsecondary Success", description: "The Bill & Melinda Gates Foundation is committed to ensuring that all students have the opportunity to receive a high-quality education. We have two programs that work in concert toward this goal: College-Ready Education, which aims to ensure that all students graduate from high school prepared to succeed in college and in a career; and Postsecondary Success, whose goal is to dramatically increase the number of young people who obtain a postsecondary degree or certificate with labor-market value. Areas of intersection include practical approaches and policy strategies to better align K-12 standards—including the Common Core State Standards—with higher-education standards. Our Postsecondary Success strategy seeks to increase low-income students’ college completion rates through innovations that can improve the productivity and performance of U.S. universities and colleges and ensure that all students have access to a high-quality, highly personalized education. Invest in these bright students.", duration: "12 months", charity_id: gates_foundation.id)
    url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544545126/graduation.jpg'
    graduation.remote_image_url = url
    graduation.save

  sustainable = Mission.new(name: "Sustainability & Self-Reliance", description: "Short-term fixes don't solve long-term problems. With the right training and education, we can build strong, healthy communities that can stand up to the challenges of hunger and poverty.", duration: "8 months", charity_id: heifer.id)
    url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544545891/sustainable.jpg'
    sustainable.remote_image_url = url
    sustainable.save

  risk_mitigation = Mission.new(name: "Risk Mitigation and Resilience", description: "We focus on preparing farmers to prevent potential shocks and document learnings to improve future outcomes. We provided revolving loans in Nepal after the 2015 earthquakes to equip farmers with the specific tools needed to rebuild. The revolving funds will remain in the community to ensure future access to capital. We make adjustments based on our learnings and encourage flexibility for creative solutions. As Hurricane Irma approached Haiti, we utilized the social tool WhatsApp to more rapidly share information with communities about how to shelter livestock and protect crops. This information was based on learnings from Hurricane Matthew, and the digital tool provided a more flexible format to reach farmers.We seek foundational changes within communities and systems to mitigate risk and encourage resilience. Our Community Managed Disaster Risk Reduction Training in the Philippines has been credited with saving lives during Typhoon Bopha and Super Typhoon Haiyan. This training is being replicated by local partners. You could be one of our partners.", duration: "48 months", charity_id: heifer.id)
    url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544546395/rice_farmer.jpg'
    risk_mitigation.remote_image_url = url
    risk_mitigation.save

  preparing = Mission.new(name: "Preparing for Climate Change", description: "Defenders is working with wildlife and natural resource managers to help them address the impacts of climate change, and develop adaptive strategies to incorporate into their conservation plans. These strategies are based on assessments of the specific threats that wildlife and ecosystems are expected to face - such as sea level rise, higher temperatures, and more frequent storms and droughts - and include monitoring to provide ongoing information about impacts on the ground. Defenders is working with managers of our national forests, and wildlife refuges to incorporate these measures into their management plans. We are also reaching out to private and tribal landowners to do the same in areas that are particularly valuable to wildlife.", duration: "ongoing", charity_id: wildlife.id)
    url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544551246/icecaps.jpg'
    preparing.remote_image_url = url
    preparing.save

  conservation = Mission.new(name: "Defending Conservation Laws", description: "Petition your government! Work jointly withour offices! Despite success and overwhelming bipartisan support from the American people, the ESA has come under repeated attacks. Unrelenting pressure from some commercial and political interests continue to threaten this vital Act, concocting legal and legislative attacks to weaken or override it, or slash its funding to a point where it can no longer function. In today's world, where more species than ever need the protections of the ESA, this tool for wildlife conservation must be kept strong enough to continue preventing extinctions and putting imperiled species back on the road to recovery.", duration: "12 months", charity_id: wildlife.id)
    url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544611055/flamingo.jpg'
    conservation.remote_image_url = url
    conservation.save

  ready = Mission.new(name: "Ready For 100", description: "Cities and communities across the country are ready for a just transition to '100%' clean, renewable energy! So far 100 cities have declared themselves ready. Help your home by contacting the local government of your headquarter's city!", duration: "24 months", charity_id: sierra.id)
    url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544612571/wind_turbine.jpg'
    ready.remote_image_url = url
    ready.save

  partnership = Mission.new(name: "The Benefits of Partnering with Earthwatch
  ", description: "Earthwatch seeks to develop strategic partnerships that contribute to global conservation agendas and enable businesses to operate environmental sustainability. Our partnerships are designed to add value to your company as well as support important environmental initiatives. Our offer to business falls into three key areas: Employee Engagement and Professional Development, Community Engagement, Supporting Environmental Research and Conservation. Many of our partnerships combine all three elements.
  There are a number of benefits to partnering with Earthwatch, including: better-informed business strategies and practices, new tools for managing environmental risks and seizing opportunities, demonstrating leadership in addressing challenges to environmental sustainability, increased employee awareness and commitment, and networking with other companies, non-governmental organizations, scientists, and environmental stakeholders.", duration: "The future", charity_id: earthwatch.id)
      url = 'https://res.cloudinary.com/iahuiahuia/image/upload/v1544625840/cleanup.jpg'
      partnership.remote_image_url = url
      partnership.save


