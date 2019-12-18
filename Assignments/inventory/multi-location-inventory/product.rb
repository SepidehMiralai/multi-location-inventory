class Product
    
    attr_accessor :id
    attr_accessor :name
    attr_accessor :price
    attr_accessor :p_quantity
    
    def initialize(prod_id, prod_name, prod_price, prod_quantity)
        
        @id = prod_id
        @name = prod_name
        @price = prod_price
        @p_quantity = prod_quantity

    end
#add a product to an inventory
    def self.add_product(p_id)
        @id = p_id
        prod_list = [] 
        puts "Please enter the id of inventory you would like to add this product to:\n"
        inv_id = gets.chomp.to_i 
            $inv_array.each do |item| 
#                puts item.fetch(:invId)   
#                puts inv_id               
                if item.fetch(:invId) == inv_id
                    
                    if item[:invProductList] == nil
                        puts "I'm here again!"
                        puts "Please enter the product name, price and quantity per line separated by a comma.\n"
                        prod = gets.chomp
                        p = prod.split(/\W+/)
                        p_id = @id
                        p_name = p[0]
                        p_price = p[1]
                        p_quantity = p[2]
                        hash = {productId: p_id , productName: p_name, productPrice: p_price, productQuantity: p_quantity} 
                        prod_list.push(hash)
                        item[:invProductList] = prod_list   
                        break         
                    else
                        prod_list = item.fetch(:invProductList)
                        found = false
                        prod_list.each do |item2|
                            puts "hey!"
                        
                            if item2.fetch(:productId) == @id
                                puts "The product exists:\n"
                                puts item2
                                puts "Please specify how many you would like to add to this product:\n"
                                num = gets.chomp.to_i
                                num = num + item2[:productQuantity].to_i
                                item2[:productQuantity] = num.to_s
                                found = true
                                break
                            end
                        end
                        if found == true
                            break
                        else
                            
                                puts "Please enter the product name, price and quantity per line separated by a comma.\n"
                                prod = gets.chomp
                                p = prod.split(/\W+/)
                                p_id = @id
                                p_name = p[0]
                                p_price = p[1]
                                p_quantity = p[2]
                                hash = {productId: p_id , productName: p_name, productPrice: p_price, productQuantity: p_quantity} 
                                prod_list.push(hash)
                                item[:invProductList] = prod_list
                                
                        end
                            
                        
                
                    end    
                end

            end
    end
#                    
    def self.del_product(p_id)
        @id = p_id
        prod_list = [] 
        puts "Please enter the id of inventory you would like to delete this product from:\n"
        inv_id = gets.chomp.to_i 
        
        $inv_array.each do |item|
            if item.fetch(:invId) == inv_id
#               puts item.fetch(:invProductList)
                p_list = item.fetch(:invProductList)
                p_list.each do |item2|
                    if item2.fetch(:productId) == @id
                        puts "Are you sure you want to delete this product?yes-no"
                        t = gets.chomp()
                        if t == "yes"
                            p_list.delete(item2)
                            item[:invProductList] = p_list
                            puts "Product deleted!"
                            break
                        end
                    end
                end
            end
        end
    end
    
    def self.view_product(p_id)
        p_id = p_id
        prod_list = []
        count = 0
        $inv_array.each do |item|
            prod_list = item.fetch(:invProductList)
            prod_list.each do |item2|
                if item2.fetch(:productId) == p_id
                    puts "The list of this product in Inventory #{count+1} is:\n"
                    puts item2
                end
            end
            count +=1
        end

    end

    def self.view_all_products
        total_prod_list = []
        prod_list = []
        count = 0
        puts "Here is the list of available products in all inventories:\n"
        $inv_array.each do |item1|
            prod_list = item1.fetch(:invProductList)
            if count == 0
                total_prod_list = item1.fetch(:invProductList) 
                count = 1
                next

            elsif count > 0
                prod_list.each do |item2|
                    found = false
                    total_prod_list.each do |item3|
                        if item2[:productId]  == item3[:productId]
                            new_count = item2[:productQuantity].to_i + item3[:productQuantity].to_i
                            item3[:productQuantity] = new_count.to_s
                            found = true
                            next
                        end
                    end
                    if found == false  
                            total_prod_list << item2
                            
                    end
                    
                end

            end

        end
        puts total_prod_list

    end

end