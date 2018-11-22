# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

user = User.new(email: "emily@eltekdataloggers.co.uk", password: "password123", password_confirmation: "password123", eltek: true, first_name: "Admin", last_name: "User", company: "Eltek")
user.save!
puts "#{user.email} saved"


require 'csv'

  CSV.foreach(Rails.root.join('lib', 'seeds', 'seed_test.csv')) do |p|
    product = Product.new(product_code: p[0], description: p[1])
    product.save!
    puts "#{product.product_code} saved"
  end

puts "There are now #{Product.count} rows in the product table."