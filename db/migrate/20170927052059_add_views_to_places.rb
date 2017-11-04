class AddViewsToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :views, :integer
    add_column :places, :likes, :integer
  end
end
