class AddLatLngToTodoItems < ActiveRecord::Migration
  def change
    add_column :todo_items, :lat, :decimal, scale: 14, precision: 20
    add_column :todo_items, :lng, :decimal, scale: 14, precision: 20
 end
end
