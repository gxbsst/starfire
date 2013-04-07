class CreateTiresTires < ActiveRecord::Migration

  def up
    create_table :refinery_tires do |t|
      t.string :category
      t.string :decorative
      t.text :content
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-tires"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/tires/tires"})
    end

    drop_table :refinery_tires

  end

end
