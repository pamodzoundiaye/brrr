class AddAttachmentPicture2ToPlaces < ActiveRecord::Migration[5.1]
  def self.up
    change_table :places do |t|
      t.attachment :picture2
    end
  end

  def self.down
    remove_attachment :places, :picture2
  end
end
