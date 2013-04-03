module Refinery
  module Tires
    module Admin
      class TiresController < ::Refinery::AdminController

        crudify :'refinery/tires/tire',
                :title_attribute => 'category', :xhr_paging => true

      end
    end
  end
end
