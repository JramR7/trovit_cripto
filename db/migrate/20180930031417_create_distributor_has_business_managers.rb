class CreateDistributorHasBusinessManagers < ActiveRecord::Migration[5.0]
  def change
    create_table :distributor_has_business_managers do |t|

      t.timestamps
    end
  end
end
