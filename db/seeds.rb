
user_classification = UserClassification.create!(
  user_classification_name: "test_id"
)

2.times do |n|
  user = User.create!(
    password:"pass",
    last_name:"太郎#{n + 1}",
    first_name:"探求#{n + 1}",
    zipcode:"000-0000",
    prefecture:"東京都",
    municipality:"探求区",
    address:"0-0",
    apartments:"探求学園10#{n + 1}",
    email:"e#{n + 1}@e.com",
    phone_number:"000-0000-000#{n + 1}",
    company_name:"探求学園",
    delete_flag: false,
    user_classification_id: user_classification.id
  )
end




# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
