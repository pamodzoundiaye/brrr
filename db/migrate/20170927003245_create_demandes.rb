class CreateDemandes < ActiveRecord::Migration[5.1]
  def change
    create_table :demandes do |t|
      t.string :description

      t.timestamps
    end
  end
end
