class AddDescriptionToRefineryTires < ActiveRecord::Migration
  def change
    add_column :refinery_tires, :description, :text
    add_column :refinery_tires, :title, :string
  end
end
