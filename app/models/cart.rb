# cart.rb

class Cart
  def initialize
    @items = []
  end

  def add_item(item_id)
    @items << item_id
  end

  def empty?
    false
    @items.empty?
  end

  def items
    @items
  end
end
