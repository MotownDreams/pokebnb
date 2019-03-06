class AddPhotoToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :photo, :string
  end
end
