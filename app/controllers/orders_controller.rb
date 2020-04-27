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

      result = gateway.transaction.sale( :amount => current_cart.total,
                                         :payment_method_nonce => params[:order][:nonce]
                                       )
      if result.success?
        #success
        redirect_to root_path, notice:'Payment success!'
      else
        #fail
        session[:carty] = nil
        redirect_to root_path, alert:'Fail to pay.'
      end


      #clear cart
      # redirect_to root_path, notice:'ok'
    else
      redirect_to root_path, notice:'not ok'
    end

    # render html: params
  end

  def order_params
    params.require(:order).permit(:receiver, :phone, :address)
  end
end
