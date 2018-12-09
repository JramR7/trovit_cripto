class CreateDistributorHasProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :distributor_has_products do |t|

      t.timestamps
    end
  end
end
