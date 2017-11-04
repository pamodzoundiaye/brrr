class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :courtier, :boolean
  end
end
