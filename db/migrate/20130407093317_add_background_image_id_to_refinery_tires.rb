class AddBackgroundImageIdToRefineryTires < ActiveRecord::Migration
  def change
    add_column :refinery_tires, :background_image_id, :integer
  end
end
