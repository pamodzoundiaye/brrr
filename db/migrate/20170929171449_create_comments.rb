class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :talker
      t.string :spot
      t.string :speech

      t.timestamps
    end
  end
end
