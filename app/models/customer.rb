class Customer < ActiveRecord::Base
  attr_accessible :name, :street

  has_many :carts, :dependent => :destroy
 
  has_many :line_items

 
  
end
