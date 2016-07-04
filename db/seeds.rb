# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ACCOUNT = YAML.load_file('config/account.yml')[Rails.env]
ACCOUNT['admin_account'].each do |email, password|
  Admin.create(:email => email, :password => password)
end
