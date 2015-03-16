class AddOnlineStoreToProducts < ActiveRecord::Migration
  def change
    add_column :products, :onlineStore, :integer
  end
end
