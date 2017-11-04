class AddLocationToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :location, :string
  end
end
