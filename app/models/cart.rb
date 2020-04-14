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

  def total 
    # @items.reduce(0) { |sum, item| sum + item.total}
    # @items.sum { |item| item.total }

    tmp = 0
    @items.each do |item|
      tmp += item.total
    end
    tmp
  end
end
