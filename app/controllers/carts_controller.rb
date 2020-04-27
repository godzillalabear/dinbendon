class CartsController < ApplicationController
  def show

  end

  def destroy
    session[:carty] = nil
    redirect_to root_path, notice: 'The cart is empty!'
  end

  def checkout
    @order = Order.new
    @token = gateway.client_token.generate
  end
end
