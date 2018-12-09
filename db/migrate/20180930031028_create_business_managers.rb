class CreateBusinessManagers < ActiveRecord::Migration[5.0]
  def change
    create_table :business_managers do |t|
      t.timestamps
    end
  end
end
