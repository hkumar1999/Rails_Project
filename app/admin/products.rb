ActiveAdmin.register Product do
    permit_params :name, :description, :price, :stock_quantity, :category, :image_url
  end
  