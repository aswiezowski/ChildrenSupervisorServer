class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :child, index: true, foreign_key: true
      t.string :summary
      t.text :description
      t.boolean :status
      t.integer :mark

      t.timestamps null: false
    end
  end
end
