class AddTowsonStoreToProducts < ActiveRecord::Migration
  def change
    add_column :products, :towsonStore, :integer
  end
end
