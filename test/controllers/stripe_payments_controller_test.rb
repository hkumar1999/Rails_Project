class StripePaymentsController < ApplicationController
  def create
    order = Order.find(session[:latest_order_id])

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: order.order_items.map do |item|
        {
          price_data: {
            currency: 'cad',
            unit_amount: (item.unit_price * 100).to_i,
            product_data: {
              name: item.product.name
            }
          },
          quantity: item.quantity
        }
      end,
      mode: 'payment',
      success_url: order_url(order),
      cancel_url: cart_url
    )

    redirect_to session.url, allow_other_host: true
  end
end
