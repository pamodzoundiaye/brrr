class AddDetailsToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :forRent, :boolean
    add_column :places, :forSale, :boolean
  end
end
