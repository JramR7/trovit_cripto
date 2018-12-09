class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.float :price
      t.string :producType
      t.string :brand
      t.string :productName
      t.integer :quantity
      t.string :description
      
      t.timestamps
    end
  end
end
