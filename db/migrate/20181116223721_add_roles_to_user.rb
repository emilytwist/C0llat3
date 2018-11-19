class AddRolesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :eltek, :boolean, default: false
    add_column :users, :distributor, :boolean, default: true
  end
end
