class AddBasicInfoToUsers < ActiveRecord::Migration[5.2]
 
  def up
  	add_column :users, :name, :string
  	change_column :users, :name, :string, null: false
  	add_column :users, :introduction, :text
  end

  def down
  	remove_column :users, :name
  	remove_column :users, :introduction
  end
  
end
