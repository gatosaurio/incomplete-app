class Customer < ActiveRecord::Base
  attr_accessible :name, :street

  has_many :carts, :dependent => :destroy
 
  has_many :line_items

  def current_cart
    if self.cart.empty?
      self.cart.create!
    end
    self.cart
  end
  
end
