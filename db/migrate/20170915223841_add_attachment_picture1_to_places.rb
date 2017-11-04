class AddAttachmentPicture1ToPlaces < ActiveRecord::Migration[5.1]
  def self.up
    change_table :places do |t|
      t.attachment :picture1
    end
  end

  def self.down
    remove_attachment :places, :picture1
  end
end
