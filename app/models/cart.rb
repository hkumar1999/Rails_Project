class Cart
    attr_reader :items
  
    def initialize(session)
      @session = session
      @items = session[:cart] || {}
    end
  
    def self.from_session(session)
      new(session)
    end
  
    def add_product(product_id, quantity = 1)
      @items[product_id.to_s] ||= 0
      @items[product_id.to_s] += quantity.to_i
      save
    end
  
    def update_quantity(product_id, quantity)
      if quantity.to_i <= 0
        @items.delete(product_id.to_s)
      else
        @items[product_id.to_s] = quantity.to_i
      end
      save
    end
  
    def remove_product(product_id)
      @items.delete(product_id.to_s)
      save
    end
  
    def products
      Product.where(id: @items.keys)
    end
  
    def items_with_details
      products.map do |product|
        {
          product: product,
          quantity: @items[product.id.to_s],
          subtotal: product.price * @items[product.id.to_s]
        }
      end
    end
  
    def total
      items_with_details.sum { |item| item[:subtotal] }
    end
  
    def total_items
      @items.values.sum
    end
  
    private
  
    def save
      @session[:cart] = @items
    end
  end
  