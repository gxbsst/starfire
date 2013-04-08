class AddListImageToRefineryTires < ActiveRecord::Migration
  def change
    add_column :refinery_tires, :list_image_id, :integer
  end
end
