#This is the main class for multi-location inventory assignment. 
require './inventory'
require './product'
require './order'
#test data:
$inv_array =[] 
#= [{invId: 1, invLocation: "toronto", invProductList: [{productId: 1 , productName: "fridge", productPrice: "1000", productQuantity: "10"}]},
#{invId: 2, invLocation: "ottawa", invProductList: [{productId: 1 , productName: "fridge", productPrice: "1000", productQuantity: "10"}]},
# {invId: 3, invLocation: "calgary", invProductList: [{productId: 1 , productName: "fridge", productPrice: "1000", productQuantity: "5"}]}]

class Shop

    p = []
    list = []
    new_list = []

    while true
            
    
        puts ("What would you like to do?(Please enter the number.)\n 1) Add inventory 2)Delete Inventory 3)View Inventory 
               4)Add a product to an inventory 5)Delete a product from an inventory 6)View a product in all inventories 
               7)View products in all inventories 8)Place order 9)View orders 10)Exit")
         
        action_num = gets.chomp.to_i
        
        case action_num
        when 1
            
            puts "Please enter the inventory id:\n"
            inv_id = gets.chomp.to_i
            puts "Please enter the inventory location (city):\n"
            inv_loc = gets.chomp
            product_list = []
            hash= {invId: inv_id, invLocation: inv_loc, invProductList: product_list}
#           hash1 = {invId: 1, invLocation: "toronto", invProductList: nil}
            i = Inventory.new(inv_id, inv_loc, product_list)
            #adding a new inventory using hash
            i.add_inventory(hash)

        
        when 2
            puts "Please enter the inventory id of the inventory you would like to delete:"
            begin
                id = Integer(gets.chomp)
            rescue
                puts "Please enter an integer number as inventory id:"
                retry
            end            
            #deleting the inventory using the inventory id
           Inventory.del_inventory(id)
            
        when 3
            puts "Please enter the inventory id:"
             begin                                         
                id = Integer(gets.chomp)         
            rescue
                 puts "Please enter an integer number as inventory id:"
                 retry                                                  
            end         
            #viewing the inventory using the inventory id               
            Inventory.view_inventory(id)

        when 4
            puts "Please enter the product id:"
            begin
                id = Integer(gets.chomp)
            rescue
                puts "Please enter an integer number as product id:"
                retry
            end    
            #adding a product to an inventory using the product id
            Product.add_product(id)

        when 5
            puts "Please enter the product id:"
            begin
                id = Integer(gets.chomp)
            rescue
                puts "Please enter an integer number as product id:"
                retry
            end    
            #deleting a product from an inventory using the product id
            Product.del_product(id)

        when 6
            puts "Please enter the product id:"
            begin
                id = Integer(gets.chomp)
            rescue
                puts "Please enter an integer number as product id:"
                retry
            end    
           #view a product in all inventories using the product id 
            Product.view_product(id)
            
                
        when 7
            #view the list of products in all inventories
            Product.view_all_products
                 

        when 8   
            puts "Please specify the order id, product(id) and its quantity separated by comma."
            item = gets.chomp
            p = item.split(/\W+/)
            o_id = p[0].to_i
            p_id = p[1].to_i
            p_num= p[2].to_i          
            order = Order.new(o_id, p_id, p_num)
            #place an order using the product id and its quantity from available inventories(the inventory in the same location will have priority)
            order.place_order

        when 9
            # view all orders
            Order.view_orders

        when 10
            #exit the program
            break

        else
            #If a number other than 1 to 10 is selected type this message.
            puts ("Wrong selection! Please try again.")
            
        end

    end
    

end
