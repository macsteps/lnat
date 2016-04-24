class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  validates :product_id,  presence: true,
                          numericality: { only_integer: true,
                                          greater_than_or_equal_to: 0 }
  validates :order_id,    presence: true,
                          numericality: { only_integer: true,
                                          greater_than_or_equal_to: 0 }
  validates :quantity,    presence: true,
                          numericality: { only_integer: true,
                                          greater_than_or_equal_to: 0 }
  validates :price,       presence: true,
                          numericality: { only_integer: true,
                                          greater_than_or_equal_to: 0 }
  validates :total,       presence: true,
                          numericality: { only_integer: true,
                                          greater_than_or_equal_to: 0 }
end
