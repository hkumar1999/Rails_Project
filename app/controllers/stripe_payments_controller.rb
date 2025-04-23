class StripePaymentsController < ApplicationController
  def create
    order = Order.find(session[:latest_order_id])

    line_items = order.order_items.map do |item|
      {
        price_data: {
          currency: "usd", # You can change to "cad" if you're charging in Canadian dollars
          unit_amount: (item.unit_price * 100).to_i, # Stripe expects amount in cents
          product_data: {
            name: item.product.name
          }
        },
        quantity: item.quantity
      }
    end

    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: line_items,
      mode: 'payment',
      success_url: "#{root_url}orders/#{order.id}",
      cancel_url: "#{root_url}cart"
    })

    redirect_to session.url, allow_other_host: true
  end
end
