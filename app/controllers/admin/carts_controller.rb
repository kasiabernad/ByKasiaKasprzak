class Admin::CartsController < Admin::CreatorController
  def show
    @order_items = current_order.order_items
  end
end
