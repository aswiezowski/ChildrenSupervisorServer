class AddIndexToChildren < ActiveRecord::Migration
  def change
    add_index :children, :name, unique: true
  end
end
