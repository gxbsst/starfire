class CreateTireItems < ActiveRecord::Migration
  def change
    create_table :tire_items do |t|
      t.string :decorative
      t.string :tyre
      t.string :aspect_ratio
      t.string :diameter
      t.references :tire

      t.timestamps
    end
    add_index :tire_items, :tire_id
    add_index :tire_items, :decorative
    add_index :tire_items, :tyre
    add_index :tire_items, :aspect_ratio
    add_index :tire_items, :diameter

  end
end
