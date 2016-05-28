class AddSlugToParents < ActiveRecord::Migration
  def change
    add_column :parents, :slug, :string
    add_index :parents, :slug, unique: true
  end
end
