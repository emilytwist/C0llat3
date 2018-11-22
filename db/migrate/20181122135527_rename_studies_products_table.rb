class RenameStudiesProductsTable < ActiveRecord::Migration[5.2]
  def change
  	rename_table :studies_products, :products_studies
  end
end
