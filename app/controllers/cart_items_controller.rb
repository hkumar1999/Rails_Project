class CartItemsController < ApplicationController
  def create
    cart = Cart.new(session)
    cart.add_product(params[:product_id], params[:quantity] || 1)
    redirect_to products_path, notice: "Product added to cart."
  end

  def update
    cart = Cart.new(session)
    cart.update_quantity(params[:product_id], params[:quantity])
    redirect_to cart_path, notice: "Quantity updated."
  end

  def destroy
    product_id = params[:id].to_s
    cart = Cart.new(session)
    cart.remove_product(product_id) # <- use the correct method name
    redirect_to cart_path, notice: "Product removed from cart."
  end
  
end
