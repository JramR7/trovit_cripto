class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :location
      t.string :email, null: false, unique: true 
      t.integer :phone
      t.string :userType ,null: false, default: 'distributor'
      
      t.timestamps
    end
  end
end
