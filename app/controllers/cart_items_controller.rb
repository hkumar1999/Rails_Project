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
    cart = Cart.new(session)
    cart.remove_product(params[:product_id])
    redirect_to cart_path, notice: "Product removed."
  end
end
