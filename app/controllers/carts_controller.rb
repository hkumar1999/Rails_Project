class CartsController < ApplicationController
  def show
    @cart = Cart.from_session(session)
  end
end
