class AddSharedToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :shared, :boolean
  end
end
