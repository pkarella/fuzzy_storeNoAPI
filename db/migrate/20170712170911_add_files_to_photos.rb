class AddFilesToPhotos < ActiveRecord::Migration[5.1]
  def self.up
      change_table :photos do |t|
        t.attachment :image
      end
    end

  def self.down
    drop_attached_file :photos, :image
  end
end
