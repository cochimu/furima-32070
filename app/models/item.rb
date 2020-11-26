class Item < ApplicationRecord

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :charge
  belongs_to :day
  belongs_to :prefecture
  belongs_to :status

  with_options presence: true do
    validates :name
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :charge_id
    validates :day_id
    validates :prefecture_id
    validates :status_id
  end
end