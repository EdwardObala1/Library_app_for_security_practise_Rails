class CreateWaitinglists < ActiveRecord::Migration[6.1]
  def change
    create_table :waitinglists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :library, null: false, foreign_key: true

      t.timestamps
    end
  end
end
