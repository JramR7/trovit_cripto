class DeleteDate < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :date
    remove_column :offers, :date
    remove_column :orders, :date
  end
end
