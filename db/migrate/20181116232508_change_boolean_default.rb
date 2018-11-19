class ChangeBooleanDefault < ActiveRecord::Migration[5.2]
	def change
	  change_column :users, :eltek, :boolean, default: nil
	  change_column :users, :distributor, :boolean, default: nil
	end
end
