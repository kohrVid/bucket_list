class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.text :name
      t.integer :likes
      t.text :image_url
      t.integer :priority
      t.text :where
      t.references :destination, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
