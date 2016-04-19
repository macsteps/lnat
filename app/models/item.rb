class Item < ActiveRecord::Base
  has_many :products, through: :cart
end
