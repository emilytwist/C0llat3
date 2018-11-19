class AddProductRefsToFaqs < ActiveRecord::Migration[5.2]
  def change
  	add_reference :faqs, :product, foreign_key: true
  end
end
