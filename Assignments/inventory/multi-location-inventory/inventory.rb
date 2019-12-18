class Inventory
    attr_accessor :inv_id
    attr_accessor :location
    attr_accessor :product_list
    
    def initialize(inv_id, location, product_list)

        @inv_id = inv_id
        @location = location
        @product_list = product_list

    end

    def add_inventory(myHash)
        $inv_array.push(myHash)
    end

    def self.del_inventory(id)
        @inv_id = id
        $inv_array.each do |item|
            if item.fetch(:invId) == @inv_id
                if item.fetch(:invProductList) == nil
                    puts ("Are you sure you want to delete this inventory?\(yes, no\)")
                    $inv_array.delete(item) unless gets.chomp() == "no"
                else puts ("It is not possible to delete this inventory because it includes some products.")

                end
            end
        end
    end

    def self.view_inventory(id)
        found = false
        @inv_id = id
        $inv_array.each do |item|        
            if item.fetch(:invId) == @inv_id   
                if item[:invProductList] == []
                    puts "Inventory is empty. No product to display!"
                    found = true
                    break;
                else 
                    prodList = item.fetch(:invProductList)
                    puts "Here is the list of products of this inventory:\n\n"
                    puts prodList
                    found = true  
                    break    
                end
            end
        end
        puts "No matching inventory! PLease try again." unless found == true          
    end

    def self.find_product(inv_id, p_id)
        prod_list = []
        @inv_id = inv_id
        $inv_array.each do |item1|
            if item1[:inv_id] == @inv_id
                prod_list = item1.fetch(:invProductList)
                prod_list.each do |item2|
                    if item2[:productId] == p_id
                        
                        return item2
                        break
                    end
                end
            end
        end

    end




end
