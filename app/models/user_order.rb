class UserOrder
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture, :city, :address, :building_name, :phone_number

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
  end
  validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }
  validates :phone_number, format: {with: /\A\d{11}\z/ }
end