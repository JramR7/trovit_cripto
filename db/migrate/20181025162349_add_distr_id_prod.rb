class AddDistrIdProd < ActiveRecord::Migration[5.0]
  change_table :products do |t|
    t.belongs_to :distributor, index: true  
  end
end
