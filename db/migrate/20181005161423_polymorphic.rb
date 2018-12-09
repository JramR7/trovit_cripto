class Polymorphic < ActiveRecord::Migration[5.0]
  def change
    change_table :pictures do |t|
      t.references :imageable, polymorphic: true, index: true
    end
  end
end
