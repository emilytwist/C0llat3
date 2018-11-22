class CreateStudies < ActiveRecord::Migration[5.2]
  def change
    create_table :studies do |t|
      t.string :name
      t.text :description
    end
  
    create_table :studies_products, id: false do |t|
    	t.belongs_to :study, index: true
    	t.belongs_to :product, index: true
    end
  end
end
