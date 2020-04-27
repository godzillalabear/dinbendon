class CartsController < ApplicationController
  def show

  end

  def destroy
    session[:carty] = nil
    redirect_to root_path, notice: 'The cart is empty!'
  end

  def checkout
    @order = Order.new

    gateway = Braintree::Gateway.new(
      :environment => :sandbox,
      :merchant_id => '72tb9jyzsyn428xr',
      :public_key => 'c38bsvwyb37ycncj',
      :private_key => '261f187dd0d8da713c7eb6fe24cadfba',
    )
    @token = gateway.client_token.generate
  end
end
