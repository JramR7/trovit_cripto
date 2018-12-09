class AddColumnToDistributor < ActiveRecord::Migration[5.0]
  def change
    add_column :distributors, :name, :string
  end
end
