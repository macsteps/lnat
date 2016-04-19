class Item < ActiveRecord::Base
  has_many :products, through: :cart
  validates_associated :products
  validates :quantity,  presence: true,
                        numericality: { only_integer: true,
                                        greater_than_or_equal_to: 0 }
end
