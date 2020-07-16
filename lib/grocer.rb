require 'pry'

def find_item_by_name_in_collection(name, collection)
  count = 0
  collection.each do |item_info|
    return item_info if item_info[:item] == name
    count += 1
  end
  nil
end

def consolidate_cart(cart)
  count = 0
  final_cart = []

  cart.each do |item_info|
    current_item = find_item_by_name_in_collection(item_info[:item], final_cart)
    if current_item
      final_cart_count = 0
      final_cart.each do |new_cart_item|
        if final_cart_item[:item] == current_item[:item]
          final_cart_item[:count] += 1
        end
        final_cart_count += 1
      end
    else
      item_info[:count] = 1
      final_cart << item_info
    end
    count += 1
  end
  final_cart
end
