# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

DEFAULT_INSECURE_PASSWORD = 'mikethefrog1'

User.create({
  first_name: "Mike",
  last_name: "The Frog",
  profile_name: "mikethefrog",
  email: "mike@teamtreehouse.com",
  password: DEFAULT_INSECURE_PASSWORD,
  password_confirmation: DEFAULT_INSECURE_PASSWORD
})

User.create({
  first_name: "Garey",
  last_name: "Simpson",
  profile_name: "gareys",
  email: "webdesignator@gmail.com",
  password: DEFAULT_INSECURE_PASSWORD,
  password_confirmation: DEFAULT_INSECURE_PASSWORD
})

User.create({
  first_name: "Jason",
  last_name: "Seifer",
  profile_name: "jason",
  email: "jason@teamtreehouse.com",
  password: DEFAULT_INSECURE_PASSWORD,
  password_confirmation: DEFAULT_INSECURE_PASSWORD
})

User.create({
  first_name: "Jim",
  last_name: "Hoskins",
  profile_name: "jim",
  email: "jim@teamtreehouse.com",
  password: DEFAULT_INSECURE_PASSWORD,
  password_confirmation: DEFAULT_INSECURE_PASSWORD
})

User.create({
  first_name: "Nick",
  last_name: "Pettit",
  profile_name: "nick",
  email: "nick@teamtreehouse.com",
  password: DEFAULT_INSECURE_PASSWORD,
  password_confirmation: DEFAULT_INSECURE_PASSWORD
})

User.create({
  first_name: "Ryan",
  last_name: "Carson",
  profile_name: "ryan",
  email: "ryan@teamtreehouse.com",
  password: DEFAULT_INSECURE_PASSWORD,
  password_confirmation: DEFAULT_INSECURE_PASSWORD
})

jason = User.find_by_email('jason@teamtreehouse.com')
jim   = User.find_by_email('jim@teamtreehouse.com')
nick  = User.find_by_email('nick@teamtreehouse.com')
mike  = User.find_by_email('mike@teamtreehouse.com')
ryan  = User.find_by_email('ryan@teamtreehouse.com')
garey  = User.find_by_email('webdesignator@gmail.com')

seed_user = garey

seed_user.statuses.create(content: "Hello, world!")
garey.statuses.create(content: "Hi, I'm Garey")
jim.statuses.create(content: "Hi, I'm Jim")
nick.statuses.create(content: "Hello from the internet!")
mike.statuses.create(content: "I want to learn html javapress")
ryan.statuses.create(content: "Treebook is awesome!")