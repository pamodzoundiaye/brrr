class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :name
      t.string :description
      t.string :categoryName
      t.decimal :price
      t.boolean :availability
      t.boolean :furnitures
      t.boolean :daily
      t.boolean :monthly

      t.timestamps
    end
  end
end
