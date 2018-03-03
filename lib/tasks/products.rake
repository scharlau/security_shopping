namespace :products do
  desc "TODO"
  task seed_tables: :environment do

    #clear tables before we do anything else
    Customer.destroy_all
    Product.destroy_all
    Cart.destroy_all
    Order.destroy_all
    LineItem.destroy_all
    p "tables emptied"

    #create some customers
    3.times do |index |
      Customer.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        address: Faker::Address.street_address
      )
    end

    #create some products
    10.times do |index|
      Product.create!(
        name: Faker::Food.dish,
        price: Faker::Number.decimal(2)
      )
    end

    #create orders from customers putting items into cart_id
    #which become line_items and then placed into order
    customers = Customer.all
    products = Product.all
    customers.each do |customer|
      item = Random.new
      order = Order.new(:customer_id =>customer.id)
      order.save
      cart = Cart.create
      #we use item.rand(10)+1 to avoid the possible result of 0
      2.times do |index|
        LineItem.create!(
            quantity: item.rand(10)+1,
            product_id: products.sample.id,
            cart_id: cart.id,
            order_id: order.id
          )
      end




    end

  end

end
