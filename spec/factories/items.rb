FactoryBot.define do
  factory :item do
    name         { Faker::Game.title }
    introduction { Faker::Game.genre }
    price        { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id  { 2 }
    status_id    { 2 }
    charge_id    { 2 }
    prefecture_id { 2 }
    day_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
