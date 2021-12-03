class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :admin, :binary, default: false
    add_column :users, :librarian, :binary, default: false
  end
end
