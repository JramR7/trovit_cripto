class AddImageColumn2 < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :image, :binary, :limit => 10.megabyte
  end
end
