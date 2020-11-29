class DeliverAddress < ApplicationRecord
  belongs_to :oder

  xtend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  
end
