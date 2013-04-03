module Refinery
  module Tires
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Tires

      engine_name :refinery_tires

      initializer "register refinerycms_tires plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "tires"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.tires_admin_tires_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/tires/tire',
            :title => 'category'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Tires)
      end
    end
  end
end
