class CreateLibraries < ActiveRecord::Migration[6.1]
  def change
    create_table :libraries do |t|
      t.text :book_title, null: false
      t.text :author, null: false
      t.integer :publish_year

      t.timestamps
    end
  end
end
