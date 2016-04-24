class Product < ActiveRecord::Base
  has_many :order_items
  validates :name, presence: true
  validates :quantity,  presence: true,
                        numericality: { only_integer: true,
                                        greater_than_or_equal_to: 0 }
  validates :price,     presence: true,
                        numericality: { greater_than_or_equal_to: 0 }

end
