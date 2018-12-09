class DeleteHasProducts < ActiveRecord::Migration[5.0]
  def change
    drop_table :distributor_has_products
  end
end
