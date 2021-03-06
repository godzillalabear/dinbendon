require 'rails_helper'


RSpec.describe Cart, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "Basic funtion" do

    let(:cart) { Cart.new }


    it "throw product into cart, and the product will be added in cart" do
      #AAA
      #Arrange
      # cart = Cart.new

      #Act
      cart.add_item(1)

      #Assert
      # expect(cart.empty?).to be false
      expect(cart).not_to be_empty
    end

    it "when add same product, only amount changes, not items" do
      # cart = Cart.new

      3.times { cart.add_item(1) }
      2.times { cart.add_item(2) }
      2.times { cart.add_item(1) }

      expect(cart.items.count).to be 2
    end

    it "item can be put in cart, also take out of cart" do
      #Arrange
      # cart = Cart.new

      i1 = create(:item)     #-> i1 = create(:item)
      i2 = create(:item)


      #Act [i1, i1, i1, i2, i2]
      3.times{cart.add_item(i1.id)}
      2.times{cart.add_item(i2.id)}

      #Assert
      expect(cart.items.first.item).to be_a Item
      expect(cart.items.first.item.price).to be i1.price

    end

    it "calculate total price of cart" do
      #Arrange
      # cart = Cart.new

      i1 = create(:item, price: 50)
      i2 = create(:item, price: 100)

      #Act [i1, i1, i1, i2, i2]
      3.times{cart.add_item(i1.id)}
      2.times{cart.add_item(i2.id)}

      #Assert
      expect(cart.total).to be 350
    end

    it "special sale event" do
      #4/1 90%off

      #Arrange
      # cart = Cart.new

      i1 = create(:item, price: 50)
      i2 = create(:item, price: 100)
      t = Time.local(2008, 4, 1, 10, 5, 0)

      #Act [i1, i1, i1, i2, i2]
      3.times{cart.add_item(i1.id)}
      2.times{cart.add_item(i2.id)}
      Timecop.travel(t)

      #Assert
      expect(cart.total).to eq 35
    end

  end
  
  describe "Advance function" do
    it "turn cart into hash" do
      #Arrange
      cart = Cart.new

      i1 = create(:item)
      i2 = create(:item)

      #Act
      3.times{cart.add_item(i1.id)}
      2.times{cart.add_item(i2.id)}

      #Assert
      expect(cart.to_hash).to eq cart_hash
    end

    it "turn hash into cart" do
      #Arrange
      #Act
      cart = Cart.from_hash(cart_hash)   #from_hash must be a class method

      #Assert
      expect(cart.items.count).to be 2

    end
    
  end
  private

  def cart_hash
    {
        "items" => [
          { "item_id" => 1, "quantity" => 3 },
          { "item_id" => 2, "quantity" => 2 }
        ]
      }
  end
end
