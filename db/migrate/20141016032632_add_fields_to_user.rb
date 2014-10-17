class AddFieldsToUser < ActiveRecord::Migration
  def up
  	add_column :users, :city, :string
  	add_column :users, :state, :string
  end

  def down
  	remove_column :users, :city
  	remove_column :users, :state
  end
end
