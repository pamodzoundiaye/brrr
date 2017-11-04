class AddAttachmentPicture4ToPlaces < ActiveRecord::Migration[5.1]
  def self.up
    change_table :places do |t|
      t.attachment :picture4
    end
  end

  def self.down
    remove_attachment :places, :picture4
  end
end
