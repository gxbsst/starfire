module Refinery
  module Tires
    class Tire < Refinery::Core::BaseModel
      self.table_name = 'refinery_tires'

      attr_accessible :category, :decorative, :content, :position, :title, :description, :tire_image_id

      acts_as_indexed :fields => [:category, :decorative, :content]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :tire_image, :class_name => '::Refinery::Image'
    end
  end
end
