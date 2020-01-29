require 'pry'

class CashRegister

    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @items = []
        @items_details = []
    end

    attr_reader :discount, :items
    attr_accessor :total

    def add_item(item, price, quantity = 1)
        @total += price * quantity
        quantity.times do 
            @items << item
        end
        @items_details << [item, price, quantity]
    end

    def apply_discount
        if @discount
            @total *= (100.0 - @discount)/100
            "After the discount, the total comes to $800."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        price = @items_details[-1][1]
        quantity = @items_details[-1][2]
        @total -= price * quantity
        @items_details.pop
    end



# binding.pry

end

