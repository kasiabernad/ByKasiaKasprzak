class Creator::CartsController < Creator::CreatorController
  def show
    @order_items = current_order.order_items
  end
end
