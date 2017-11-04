class CreateAimes < ActiveRecord::Migration[5.1]
  def change
    create_table :aimes do |t|
      t.string :liker
      t.string :liked

      t.timestamps
    end
  end
end
