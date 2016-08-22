class RenameWhereInTodoItems < ActiveRecord::Migration
  def change
    rename_column :todo_items, :where, :location
  end
end
