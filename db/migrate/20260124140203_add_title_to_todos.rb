class AddTitleToTodos < ActiveRecord::Migration[8.1]
  def change
    add_column :todos, :title, :string
  end
end
