FactoryBot.define do
  factory :item do
    name         { Faker::Game.title }
    introduction { Faker::Game.genre }
    price        { Faker::Number.between(from: 300, to: 9999999) }
    association :category
    association :status
    association :charge
    association :prefecture
    association :day
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end