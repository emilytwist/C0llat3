class AddLastViewedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_viewed, :string, array: true, default: []
  end
end
