FactoryBot.define do
  factory :user_order do
    post_code     { '123-4567' }
    prefecture_id { 13 }
    city          { '松戸市' }
    address       { '松戸1307-1' }
    building_name { '松戸ビル' }
    phone_number  { '09012345678' }
  end
end