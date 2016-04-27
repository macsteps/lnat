class OrderItemsController < ApplicationController
  def create
    if current_user.order.id
      @order_item = OrderItem.new()
  end

  def update
  end

  def destroy
  end
end
