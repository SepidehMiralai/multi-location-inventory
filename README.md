# multi-location-inventory
This project models a multi-location inventory system. Using this project we can add/view/delete inventories in different 
locations and add/view/delete products to/from these inventories. 
When creating an inventory for the first time, we should specify the inventory id and location(e.g city name).
When adding a product to an inventory, we should specify the product id and then product name, price and quantity. Then that 
product is added to that specific inventory. 
We can also make order for specific products from inventories. When making orders we should specify the order id, product id 
and the product quantity of the order. Then we should specify the customer's location. The program first looks into the 
inventory in the same location and checks if the ordered product is available in it or not. If it is available, it is 
going to place the order from that inventory and update the quantity of related product in it. Otherwise it is 
going to check inventories of other locations and make the order from the first inventory in which that product with the 
order quantity is available.   
