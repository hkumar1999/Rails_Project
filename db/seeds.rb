require 'open-uri'

# Only seed categories and products if they don't exist (avoids duplication)
if Category.count == 0
  categories = ["Food", "Toys", "Accessories", "Health"].map do |name|
    Category.create!(name: name)
  end

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
end

# Define all provinces
all_provinces = [
  { name: "Ontario", pst: 0.0, gst: 0.0, hst: 0.13 },
  { name: "Quebec", pst: 0.09975, gst: 0.05, hst: 0.0 },
  { name: "British Columbia", pst: 0.07, gst: 0.05, hst: 0.0 },
  { name: "Alberta", pst: 0.0, gst: 0.05, hst: 0.0 },
  { name: "Nova Scotia", pst: 0.0, gst: 0.0, hst: 0.15 },
  { name: "Manitoba", pst: 0.07, gst: 0.05, hst: 0.0 },
  { name: "New Brunswick", pst: 0.0, gst: 0.0, hst: 0.15 },
  { name: "Prince Edward Island", pst: 0.0, gst: 0.0, hst: 0.15 },
  { name: "Newfoundland and Labrador", pst: 0.0, gst: 0.0, hst: 0.15 },
  { name: "Saskatchewan", pst: 0.06, gst: 0.05, hst: 0.0 },
  { name: "Northwest Territories", pst: 0.0, gst: 0.05, hst: 0.0 },
  { name: "Yukon", pst: 0.0, gst: 0.05, hst: 0.0 },
  { name: "Nunavut", pst: 0.0, gst: 0.05, hst: 0.0 }
]

# Add or update provinces
all_provinces.each do |data|
  province = Province.find_or_initialize_by(name: data[:name])
  province.update!(pst: data[:pst], gst: data[:gst], hst: data[:hst])
end

puts "✅ Provinces added or updated successfully!"
