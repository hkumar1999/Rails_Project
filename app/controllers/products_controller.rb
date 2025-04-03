class ProductsController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.all

    # Keyword search
    if params[:query].present?
      keyword = "%#{params[:query].downcase}%"
      @products = @products.where("LOWER(name) LIKE ? OR LOWER(description) LIKE ?", keyword, keyword)
    end

    # Filter by category
    if params[:category_id].present?
      @products = @products.where(category_id: params[:category_id])
    end

    # Filter by dropdown option
    if params[:filter].present?
      case params[:filter]
      when 'on_sale'
        @products = @products.where("stock_quantity > ?", 30)
      when 'new'
        @products = @products.where("created_at >= ?", 3.days.ago)
      end
    end

    @products = @products.page(params[:page]).per(6)
  end

  def show
    @product = Product.find(params[:id])
  end
end
