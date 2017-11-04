class AddAubToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :auberge, :boolean
  end
end
