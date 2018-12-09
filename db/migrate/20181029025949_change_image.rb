class ChangeImage < ActiveRecord::Migration[5.0]
  def change
    change_column :pictures, :image, :string
  end
end
