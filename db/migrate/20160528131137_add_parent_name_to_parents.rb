class AddParentNameToParents < ActiveRecord::Migration
  def change
    add_column :parents, :parent_name, :string
    add_index :parents, :parent_name, unique: true 
  end
end
