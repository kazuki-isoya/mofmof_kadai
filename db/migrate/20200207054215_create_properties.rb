class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :address, null: false
      t.integer :age, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
