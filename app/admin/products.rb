ActiveAdmin.register Product do
  # Scope for showing all products by default
  scope :all, default: true

  # Scope for 'On Sale' products
  scope :on_sale do |products|
    products.where("stock_quantity > ?", 30)
  end

  # Scope for 'New Products' added within the last 3 days
  scope :new_products do |products|
    products.where("created_at >= ?", 3.days.ago)
  end
  # 👇 Add :category_id to the permitted parameters
  permit_params :name, :description, :price, :stock_quantity, :image, :category_id

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :stock_quantity
    column :category # 👈 Show category name
    column :created_at
    actions
  end

  filter :name
  filter :price
  filter :stock_quantity
  filter :category # 👈 Add category filter
  filter :created_at

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :stock_quantity
      f.input :category, as: :select, collection: Category.all # 👈 Dropdown list
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :stock_quantity
      row :category # 👈 Display assigned category
      row :image do |product|
        if product.image.attached?
          image_tag url_for(product.image), style: "max-width: 200px;"
        end
      end
      row :created_at
      row :updated_at
    end
  end
end
