require 'faker'
#include Faker
I18n.reload!
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
    Company.create!([{
        name: Faker::Company.name,
        companyType: Faker::Company.industry,
        location: Faker::Address.street_address
        }])
    company = Company.last

    User.create!([{
        name: Faker::Name.name,
        location: Faker::Address.street_address,
        userType: Faker::Types.rb_string(2),
        phone: Faker::Number.number(7),
        email: Faker::Internet.email,
        password: '12345678'
       }])
    user = User.last
    
    BusinessManager.create!([{
        user_id: user.id,
        company_id: company.id
        }])
    business_manager = BusinessManager.last
    
    Distributor.create!([{
        user_id: user.id,
        }])
    distributor = Distributor.last

    Product.create!([{
        price: Faker::Number.positive,
        producType: Faker::Types.rb_string(2),
        brand: Faker::Types.rb_string(2),
        productName: Faker::Types.rb_string(2),
        description: 'default description',
        quantity: Faker::Number.digit,
        distributor_id: distributor.id
        }])
    product = Product.last

    Offer.create!([{
        quantity: Faker::Number.digit,
        }])
    offer = Offer.last

    Order.create!([{
        quantity: Faker::Number.digit,
        }])
    order = Order.last

    Picture.create!([{
        pictureType: Faker::Types.rb_string(2),
        pictureUrl: "https://www.google.com/search?client=ubuntu&channel=fs&q=url+faker&ie=utf-8&oe=utf-8"
        }])
    picture = Picture.last

    Message.create!([{
        message: 'default message',
        distributor_id: distributor.id,
        business_manager_id: business_manager.id
        }])
    message = Message.last

    DistributorHasBusinessManager.create!([{
        distributor_id: distributor.id,
        business_manager_id: business_manager.id
    }])
end
