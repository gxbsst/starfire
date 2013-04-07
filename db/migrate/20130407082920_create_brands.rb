class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :brand_name_zh
      t.string :brand_name_en
      t.string :car_type_zh
      t.string :car_type_en
      t.integer :tire_id

      t.timestamps
    end
    add_index :brands, :brand_name_en
    add_index :brands, :brand_name_zh
    add_index :brands, :car_type_en
    add_index :brands, :car_type_zh
  end
end
