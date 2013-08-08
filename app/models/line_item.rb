class LineItem < ActiveRecord::Base
  attr_accessible :cart, :cart_id, :product, :product_id, :customer, :customer_id, :quantity, :unit_price

  belongs_to :cart
  belongs_to :product
  belongs_to :customer

  def full_price
	unit_price * quantity
  end
end
