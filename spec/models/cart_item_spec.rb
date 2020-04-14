require 'rails_helper'

RSpec.describe CartItem, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "Basic function"  do
    it "every cart item can calculate its own total price" do
      #Arrange
      cart = Cart.new

      i1 = FactoryBot.create(:item, price: 50)
      i2 = FactoryBot.create(:item, price: 100)

      #Act
      3.times { cart.add_item(i1.id) }
      2.times { cart.add_item(i2.id) }


      #Assert
      expect(cart.items.first.total).to be 150
    end
  end
end
