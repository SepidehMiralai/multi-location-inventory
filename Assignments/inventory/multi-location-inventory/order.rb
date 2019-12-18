
$order_list = []
class Order
    attr_accessor :id
    attr_accessor :prod_id
    attr_accessor :prod_number
    hash = {}
    


    def initialize(o_id, p_id, p_num)
        
        @id = o_id
        @prod_id= p_id
        @prod_number = p_num
    end

    def place_order
        
        prod_list = []
        hash ={orderId: @id, productId: @prod_id, productNumber: @prod_number}
        puts "Please enter the customer location:\n"
        loc = gets.chomp
        done = false
        found_product = false
        $inv_array.each do |item1|
            if item1[:invLocation] == loc
                prod_list = item1.fetch(:invProductList)
                # p " prod_list #{prod_list}"
                prod_list.each do |item2|
                    # puts "item2: #{item2}"
                    if item2[:productId] == @prod_id
                        quantity = item2[:productQuantity].to_i
                        if quantity >= @prod_number
                            quantity = quantity - @prod_number
                            item2[:productQuantity] = quantity.to_s
                            
                            puts "Order done!\n"
                            done = true
                            $order_list.push(hash)

                            puts "updated product list: if q> order\n"
                            puts item2
                            found_product = true
                            break
                        else  
                            
                            remain = @prod_number.to_i - quantity
                            quantity = 0
                            item2[:productQuantity] = quantity.to_s
                            puts "new product list if q<order:\n"
                            puts item2
                            found_product = true
                            check_order(remain)
                            break
                            
                        end

                    end
                end
                # if found_product == false
                #     remain = @prod_number
                #     p "in place_order  remain:#{remain}"
                #     check_order(remain)
                # end
            end
        end    
            
    end

    def self.view_orders
        puts "List of orders:"
        puts $order_list

    end

    def check_order(remain)
        $inv_array.each do |item1|
            prod_list = item1.fetch(:invProductList)
            prod_list.each do |item2|
                if item2[:productId] == @prod_id
                    quantity = item2[:productQuantity].to_i
                    if quantity >= remain
                        quantity = quantity - remain
                        # complete = true
                        item2[:productQuantity] = quantity.to_s
                        
                        puts "Order done! updated quantity #{quantity}\n"
                        done = true
                        $order_list.push(hash)

                        puts "new product list:\n"
                        puts item2
                        found_product = true
                        break
                    else  
                        # compelete = false
                        remain = remain - quantity
                        if remain == 0
                            check_order(remain)
                        end
                     
                    end
                end 
            end
        end   

    end

end




