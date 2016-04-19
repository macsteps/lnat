class Product < ActiveRecord::Base
  belongs_to :item
  validates :name, presence: true
  validates :quantity,  presence: true,
                        numericality: { only_integer: true,
                                        greater_than_or_equal_to: 0 }
  validates :price,     presence: true,
                        numericality: { only_integer: true,
                                        greater_than_or_equal_to: 0 }
end
