class OrdersController < ApplicationController

  def create
    # @order = Order.new(order_params)
    # @order.user = current_user
    @order = current_user.orders.build(order_params)


    current_cart.items.each do |cart_item|
      #get every cart item by item, price and quantity
      i = OrderItem.new(item: cart_item.item, 
                        price: cart_item.item.price, 
                        quantity: cart_item.quantity)
      #push them into order item
      @order.order_items << i
    end


    if @order.save
      #pay
      #clear cart
      redirect_to root_path, notice:'ok'
    else
      redirect_to root_path, notice:'not ok'
    end

    # render html: params
  end

  def order_params
    params.require(:order).permit(:receiver, :phone, :address)
  end
end
