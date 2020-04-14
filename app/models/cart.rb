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
    result = @items.sum { |item| item.total }
    # @items.reduce(0) { |sum, item| sum + item.total}
    # tmp = 0
    # @items.each do |item|
    #   tmp += item.total
    # end
    # tmp

    #april fool 90% off
    if Time.now.month == 4 and Time.now.day == 1
      result = result * 0.1
    end

    result
  end

  def to_hash

    # items = []
    # @items.each do |item|
    #   items << { "item_id" => item.item_id, 
    #              "quantity" => item.quantity } 
    # end

    items = @items.map { |item| 
      { "item_id" => item.item_id, "quantity" => item.quantity } 
    }

    result = {
        "items" => items
      }
  end
end
