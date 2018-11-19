class AddProductRefToNotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :notes, :product, foreign_key: true
  end
end
