# cart.rb

class Cart
  def initialize
    @items = []
  end

  def add_item(item_id)
    #check if item_id is same
    found_item = @items.find { |item| item.item_id == item_id}

    if found_item
      #found will return the found item_id, .class will show CartItem
      found_item.increment!
    else
      @items << CartItem.new(item_id)
    end

  end

  def empty?
    false
    @items.empty?
  end

  def items
    @items
  end
end
