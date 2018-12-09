class AddUrlsToPictures < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :pictureUrl, :string
  end
end
