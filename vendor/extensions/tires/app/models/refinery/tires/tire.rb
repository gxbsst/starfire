module Refinery
  module Tires
    class Tire < Refinery::Core::BaseModel
      self.table_name = 'refinery_tires'

      attr_accessible :category, :decorative, :content, :position

      acts_as_indexed :fields => [:category, :decorative, :content]

      validates :category, :presence => true, :uniqueness => true
    end
  end
end
