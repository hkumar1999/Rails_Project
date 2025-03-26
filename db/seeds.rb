# Clear old data
Product.destroy_all
Category.destroy_all

# Create Categories
categories = ["Food", "Toys", "Accessories", "Health"].map do |name|
  Category.create!(name: name)
end

# Create Products
10.times do |i|
  Product.create!(
    name: "Product #{i + 1}",
    description: "This is a great product for your pet.",
    price: rand(10..50),
    stock_quantity: rand(5..20),
    category: categories.sample,
    image: {
      io: URI.open("https://picsum.photos/300?random=#{i + 1}"),
      filename: "product#{i + 1}.jpg"
    }
  )
end
