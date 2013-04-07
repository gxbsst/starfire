class Brand < ActiveRecord::Base
  attr_accessible :brand_name_en, :brand_name_zh, :car_type_en, :car_type_zh, :tire_id
  belongs_to :tire, :class_name => "::Refinery::Tires::Tire"

  class << self

    def brand_collection
      order(:brand_name_zh).group(:brand_name_zh).collect{|s| [s.brand_name_zh] unless s.brand_name_zh.blank? }.compact
    end

    def car_type_collection
      order(:car_type_zh).group(:car_type_zh).collect{|s| [s.car_type_zh] unless s.car_type_zh.blank? }.compact
    end

  end
end
