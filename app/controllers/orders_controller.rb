class OrdersController < ApplicationController
  def new
    @provinces = Province.all
    @cart = Cart.new(session)
  end

  def create
    @cart = Cart.from_session(session)
    user = current_user if user_signed_in?

    selected_province = if user&.province.present?
                          user.province
                        else
                          Province.find(params[:province_id])
                        end

    pst = selected_province.pst || 0
    gst = selected_province.gst || 0
    hst = selected_province.hst || 0

    address     = user&.address || params[:address]
    postal_code = user&.postal_code || params[:postal_code]

    # Create the order but mark as Pending
    order = Order.create!(
      total_price: @cart.total,
      status: "Pending",
      province: selected_province,
      address: address,
      postal_code: postal_code,
      user: user
    )

    @cart.items_with_details.each do |item|
      order.order_items.create!(
        product_id: item[:product].id,
        quantity: item[:quantity],
        unit_price: item[:product].price
      )
    end

    # Save order ID for redirect after payment
    session[:latest_order_id] = order.id

    # Redirect to Stripe checkout
    redirect_to create_checkout_session_path, allow_other_host: true, status: :see_other

  end

  def show
    @order = Order.find(params[:id])
  end
end
