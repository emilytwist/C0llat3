class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
    end

    create_table :categories_studies, id: false do |t|
    	t.belongs_to :study, index: true
    	t.belongs_to :category, index: true
    end
  end
end
