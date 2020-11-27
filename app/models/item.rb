class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :charge
  belongs_to :day
  belongs_to :prefecture
  belongs_to :status

  with_options presence: true do
    validates :name
    validates :introduction
    validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :charge_id
    validates :day_id
    validates :prefecture_id
    validates :status_id
  end
end
