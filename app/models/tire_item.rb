# encoding: utf-8
class TireItem < ActiveRecord::Base
  belongs_to :tire, :class_name => "::Refinery::Tires::Tire"
  attr_accessible :aspect_ratio, :decorative, :diameter, :tyre

  class << self

    def tyre_all_collection
      tyre_collection + [["轮胎直径", 'disable']] + tyre_with_x_collection
    end

    # 轮胎
    def tyre_collection
      # where(["tyre not like ? ", "%X%"]).group(:tyre).collect{|p| [("&nbsp;&nbsp;" + p.tyre).html_safe, p.] unless p.tyre.blank? }.compact
      where(["aspect_ratio is NOT NULL "]).group(:tyre).collect{|p| [("&nbsp;&nbsp;" + p.tyre).html_safe , p.tyre] unless p.tyre.blank? }.compact
    end

    def tyre_with_x_collection
      # where(["tyre like ?", "%.%"]).group(:tyre).collect{|p| [("&nbsp;&nbsp;" + p.tyre).html_safe, p.tyre] unless p.tyre.blank? }.compact
      where("aspect_ratio is NULL").group(:tyre).collect{|p| [("&nbsp;&nbsp;" + p.tyre).html_safe, "#{p.tyre}-2"] unless p.tyre.blank? }.compact
    end

    # 扁平比
    def aspect_ratio_collection
      group(:aspect_ratio).collect{|p| [p.aspect_ratio, p.aspect_ratio] unless p.aspect_ratio.blank? }.compact
    end

    # 直径
    def diameter_collection
      group(:diameter).collect{|p| [p.diameter, p.diameter] unless p.diameter.blank? }.compact
    end

    # 品牌
    def brand_collection
      order(:brand).group(:brand).collect{|p| [p.brand, p.brand] unless p.brand.blank? }.compact
    end

    # 车型
    def car_type_collection
      group(:car_type).collect{|p| [p.car_type, p.car_type] unless p.car_type.blank? }.compact
    end

    # 花纹
    def decorative_collection
      ::Refinery::Tires::Tire.group(:decorative).order(:position).collect{|p| [p.decorative, p.decorative] unless p.decorative.blank?  }.compact
    end


    def name_all_collection
      name_collection + [["花纹", 'disable']] + name_with_x_collection
    end

    def name_collection
      where(["decorative not like ?", "%*%"]).group(:decorative).collect{|p| [("&nbsp;&nbsp;" + p.decorative).html_safe, p.decorative]unless p.decorative.blank? }.compact
    end

    def name_with_x_collection
      where(["decorative like ?", "%*%"]).group(:decorative).collect{|p| [("&nbsp;&nbsp;" + p.decorative).html_safe, p.decorative] unless p.decorative.blank? }.compact
    end

  end
end
