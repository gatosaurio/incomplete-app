class ApplicationController < ActionController::Base
 protect_from_forgery
  helper_method [:current_cart, :empty_cart, :last_line_item, :penultimate_cart, :new_session, :last_cart]

 protected

  	def current_cart
      session[:cart_id] ||= Cart.create!.id
      current_cart ||= Cart.find(session[:cart_id])
    end

  
    def new_session
      if action_name == 'new' 
      	@current_cart = nil

  	  else
  	    session[:cart_id] = nil
  	    current_cart = @current_cart
  	end
  	end

  	def last_cart
  		last_cart = Cart.find(:last)
  	end

  	def last_line_item
  		line_item = LineItem.find(:last)
  	end

  	def penultimate_cart
  		penultimate = Cart.all
  		penultimate[-2]
  	end

  	


  	
end
