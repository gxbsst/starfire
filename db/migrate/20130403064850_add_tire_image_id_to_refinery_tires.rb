class AddTireImageIdToRefineryTires < ActiveRecord::Migration
  def change
    add_column :refinery_tires, :tire_image_id, :integer
  end
end
