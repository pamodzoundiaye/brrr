class AddUidToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :uid, :string
  end
end
