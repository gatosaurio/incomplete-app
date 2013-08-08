class CartsController < ApplicationController

  after_filter :new_session  


  def new
  	@products = Product.all
    @current_cart = current_cart
    #@cart = Cart.find(params[:cart_id])
    @cart = Cart.new
  end

  def create
    @customer = Customer.find(params[:customer_id])
  	@cart = @customer.carts.build(params[:cart])
  	if @cart.save
  		flash[:notice] = "Cart created"
  		redirect_to root_url
  	else
  		render 'new'

    end 
  end

  def show
    @customer = Customer.find(params[:customer_id])
    @cart = @customer.carts.find(params[:id])
    @line_items = @customer.line_items.find(params[:id])
    

  end

end
