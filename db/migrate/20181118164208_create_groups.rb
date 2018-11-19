class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
    	t.string :name
    	t.text :description
    end

    create_table :groups_products, id: false do |t|
    	t.belongs_to :group, index: true
    	t.belongs_to :product, index: true
    end
  end
end
