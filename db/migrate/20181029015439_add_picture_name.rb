class AddPictureName < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :imageName, :string
  end
end
