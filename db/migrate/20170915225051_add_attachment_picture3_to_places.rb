class AddAttachmentPicture3ToPlaces < ActiveRecord::Migration[5.1]
  def self.up
    change_table :places do |t|
      t.attachment :picture3
    end
  end

  def self.down
    remove_attachment :places, :picture3
  end
end
