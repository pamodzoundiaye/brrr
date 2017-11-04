class AddDetailsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :adress, :string
    add_column :users, :cellNumber, :string
  end
end
