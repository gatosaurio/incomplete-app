class LineItemsController < ApplicationController

	
	def create
	  #@cart = Cart.find(params[:cart_id])
    @customer = Customer.find(params[:customer_id])
		@product = Product.find(params[:product_id])
    	if LineItem.exists?(:cart_id => current_cart.id, :product_id => @product.id, :customer_id => @customer.id)
      		item = LineItem.find(:first, :conditions => [ "cart_id = #{current_cart.id} AND product_id = #{@product.id} AND customer_id = #{@customer.id}" ])
      		LineItem.update(item.id, :quantity => item.quantity + 1)
    	else  
        @line_item = current_cart.line_items.create!(:cart => current_cart, :product => @product, :customer => @customer, :quantity => 1, :unit_price => @product.price)
     		flash[:notice] = "Added #{@product.name} to cart."
    
    	end
    redirect_to new_customer_cart_path
  	end

end
