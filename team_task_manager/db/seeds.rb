# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



p1 = Project.create(name: "Test Project 1", description: "this is a test project and it is the first")
Project.create(name: "Test Project 2", description: "this is a test project and it is the second")
Project.create(name: "Test Project 3", description: "this is a test project and it is the third")
Project.create(name: "Test Project 4", description: "this is a test project and it is the fourt")
Project.create(name: "Test Project 4", description: "this is a test project and it is the fifth")
Project.create(name: "Test Project 6", description: "this is a test project and it is the sixth")
Project.create(name: "Test Project 7", description: "this is a test project and it is the seventh")

u1 = User.create(name: "Steve Jobs", email: "applelover@test.com", password: "ILoveApple5")
User.create(name: "Mark Cuban", email: "bball4life@test.com", password: "MoneyDallas7")
User.create(name: "Bob Barker", email: "spinthewheel@test.com", password: "ThePriceIs$")
User.create(name: "Will Smith", email: "iamlegend@test.com", password: "FreshPrince1")
User.create(name: "Barney Stinson", email: "playerkingofnyc@test.com", password: "Legendary1")


t1 = p1.tasks.create(description: "learn to code")
t1.user = u1


