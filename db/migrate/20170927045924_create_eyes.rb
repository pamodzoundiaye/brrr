class CreateEyes < ActiveRecord::Migration[5.1]
  def change
    create_table :eyes do |t|
      t.string :viewer
      t.string :viewee

      t.timestamps
    end
  end
end
