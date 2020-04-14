# cart_item.rb

class CartItem
  attr_reader :item_id, :quantity

  def initialize(item_id, quantity = 1)
    @item_id = item_id
    @quantity = quantity
  end

  def increment!(n = 1)
    @quantity += n
  end

  def item
    #return the specific cart_item
    Item.find(@item_id)
  end
end