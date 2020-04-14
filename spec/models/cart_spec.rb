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

    it "when add same product, only amount changes, not items" do
      cart = Cart.new

      3.times { cart.add_item(1) }
      2.times { cart.add_item(2) }
      2.times { cart.add_item(1) }

      expect(cart.items.count).to be 2
    end

    it "item can be put in cart, also take out of cart" do
      #Arrange
      cart = Cart.new

      i1 = FactoryBot.create(:item)
      i2 = FactoryBot.create(:item)


      #Act [i1, i1, i1, i2, i2]
      3.times{cart.add_item(i1.id)}
      2.times{cart.add_item(i2.id)}

      #Assert
      expect(cart.items.first.item).to be_a Item
      expect(cart.items.first.item.price).to be i1.price

    end

  end
  
  describe "Advance function" do
    
  end
end
