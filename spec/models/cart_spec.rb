require 'rails_helper'


RSpec.describe Cart, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "Basic funtion" do
    it "throw product into cart, and the product will be added in cart" do
      #AAA
      #Arrange
      cart = Cart.new
      #Act
      cart.add_item(1)
      #Assert
      expect(cart.empty?).to be false
    end
  end
  describe "Advance function" do
    
  end
end
