class AddPhotoUrlToMPs < ActiveRecord::Migration[6.1]
  def change
    add_column :mps, :photo_url, :string
  end
end
