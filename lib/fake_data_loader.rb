# Put, inside the load method, the necessary code to generate data with DEVELOPMENT PURPOSES.
# Whenever you can, use FactoryGirl's methods to keep this code "self updated".
#
# For Example:
#
# Having a country factory in /spec/factories/countries.rb
#
# FactoryGirl.define do
#   factory :country do
#     name "Chile"
#     locale "es-CL"
#     currency "$CLP"
#   end
# end
#
# Choose to do this:
#
# create(:country)
#
# Instead of this:
#
# Country.create(name: "Chile", locale: "es-CL", currency: "$CLP")
#

Faker::Config.locale = I18n.locale

module FakeDataLoader
  extend FactoryGirl::Syntax::Methods

  def self.load
    load_admin
  end

  def self.load_admin
    email = "admin@example.com"
    pass = "password"
    admin = User.find_by(email: email)
    User.create!(email: email, password: pass, password_confirmation: pass) unless admin
  end
end
