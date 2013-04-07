class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :provice
      t.string :city
      t.string :dist
      t.string :shop_name
      t.string :shop_type
      t.float :longitude
      t.float :latitude
      t.string :address
      t.string :full_address

      t.timestamps
    end
    add_index :stores, :provice
    add_index :stores, :city
    add_index :stores, :dist
    add_index :stores, :shop_name
    add_index :stores, :shop_type
    add_index :stores, :longitude
    add_index :stores, :latitude
    add_index :stores, :address
    add_index :stores, :full_address
  end
end
