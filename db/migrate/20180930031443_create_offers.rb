class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.integer :quantity
      t.date :date
      
      t.timestamps
    end
  end
end
