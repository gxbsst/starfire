# encoding: utf-8
class SearchsController < ApplicationController

  def index
    if params[:type] == "brand"
      @products ||= find_brands
    else
      @products ||= find_products
    end
    @tires = @products.collect(&:tire).uniq.compact! if @products
  end
  
  private 

  def find_products
    tyre = params[:tyre]
    aspect_ratio = params[:aspect_ratio]
    diameter = params[:diameter]
    brand = params[:brand]
    car_type = params[:car_type]
    decorative = params[:decorative]
    
    @products = TireItem.order(:tyre).group(:decorative)
    # products = products.where("tyre like ?", "%#{keywords}%") if keywords.present?
    @products = @products.where(tyre: tyre).group(:decorative) if tyre.present?
    @products = @products.where(aspect_ratio: aspect_ratio).group(:decorative) if aspect_ratio.present?
    @products = @products.where(diameter: diameter).group(:decorative) if diameter.present?
    @products = @products.where(brand: brand).group(:decorative) if brand.present?
    @products = @products.where(car_type: car_type).group(:decorative) if car_type.present?
    @products = @products.where(decorative: decorative).group(:decorative) if decorative.present?
    @products
  end
  
  
  def find_brands
    brand = params[:brand]
    car_type = params[:car_type]
    name = params[:name]
    @products = Brand.order(:name).group(:name)
    p @products
    @products = @products.where(brand_name_zh: brand).group(:name) if brand.present?
    p @products
    @products = @products.where(car_type_zh: car_type).group(:name) if car_type.present?
    p 3333333
    @products = @products.where(name: name).group(:name) if name.present?
    p 4444444
    @products
  end

end