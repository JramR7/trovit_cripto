class Associations < ActiveRecord::Migration[5.0]
  def change

    change_table :distributors do |t|
      t.belongs_to :user, index: true
    end

    change_table :distributor_has_business_managers do |t|
      
      t.belongs_to :distributor, index: true
      t.belongs_to :business_manager,  index: {:name => "index_business_manager_id"}
    
    end

    change_table :business_managers do |t|
      
      t.belongs_to :user, index:true 
      t.belongs_to :company, index:true
    
    end

    change_table :orders do |t|
    
      t.belongs_to :product, index: true
      t.belongs_to :message , index: true
      t.belongs_to :business_manager, index: true 
    end

    change_table :offers do |t|
      t.belongs_to :message, index: true
      t.belongs_to :product , index: true
      t.belongs_to :distributor , index: true
    end

    change_table :messages do |t|
      t.belongs_to :distributor, index: true
      t.belongs_to :business_manager, index: true
    end

  end
end