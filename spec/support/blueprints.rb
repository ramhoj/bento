require 'machinist/active_record'
require 'sham'
require 'ffaker'

Sham.name                      { Faker::Name.name }
Sham.company_name              { Faker::Company.name }
Sham.first_name                { Faker::Name.first_name }
Sham.last_name                 { Faker::Name.last_name }
Sham.email                     { Faker::Internet.email }
Sham.date                      { Date.civil((1990...2010).to_a.choice, (1..12).to_a.choice, (1..28).to_a.choice) }
Sham.account(:unique => false) { Account.find_or_create_by_name("Elabs") }
Sham.plan(:unique => false)    { %w[bronze silver gold].choice }

Project.blueprint do
  account
  name    { Sham.name }
end

Account.blueprint do
  name       { Sham.company_name }
  email      { Sham.email }
  password   { 'test1234' }
  first_name { Sham.first_name }
  last_name  { Sham.last_name }
  plan       { Sham.plan }
end

Site.blueprint do
  name       { Sham.company_name }
end

User.blueprint do
  email { Sham.email }
  password { "test1234" }
end