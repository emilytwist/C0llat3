class AddOptionsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :options, :text
  end
end
