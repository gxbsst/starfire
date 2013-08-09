class Api::RegionsController < ApplicationController
  respond_to :json
  layout nil
  
  #######################################################
  ## 中国地区
  #######################################################
  
  def locals
    # type = params[:type]
    parent_id = params[:parent_id]
    locals = Store.where(:provice => parent_id).group(:city)
    render :json => locals
  end
  
  def aspect_ratio
    parse = params[:parent_id].split('-')
    tyre = parse[0]
    # 轮辋直径
    is_lunguang = parse[1].present? ? true : false
    if is_lunguang 
      products = ::TireItem.where(["tyre = ? AND aspect_ratio IS NULL", tyre] ).group(:tyre)
    else
      products = ::TireItem.where(["tyre = ? AND aspect_ratio IS NOT NULL", tyre] ).group(:aspect_ratio)
    end
    render :json => products
  end
  
  def diameter

    parse = params[:parent_id].split('-')
    aspect_ratio = parse[0]
    
    # aspect_ratio = params[:parent_id]
    
    if params[:parent_type] == 'tyre'

      is_lunguang = parse[1].present? ? true : false
      # 轮辋直径
      if is_lunguang 
        products = ::TireItem.where(["tyre = ? AND aspect_ratio IS NULL", aspect_ratio] ).group(:diameter)
      else
        products = ::TireItem.where(["tyre = ? AND aspect_ratio IS NOT NULL", tyre] ).group(:diameter)
      end

      # products = ::TireItem.where( :tyre => aspect_ratio ).group(:diameter)
    else
      products = ::TireItem.where( :aspect_ratio => aspect_ratio ).group(:diameter)
    end
    
    render :json => products
  end
  
  def car_type
    brand = params[:parent_id]
    brands = Brand.where(:brand_name_zh => brand).group(:car_type_zh).order("CONVERT( car_type_zh USING gbk)")
    render :json => brands
  end
  
  
  # def china_provinces
  #   parent_id = params[:parent_id]
  #   provinces = Region.provinces(parent_id)
  #   render :json => provinces
  # end
  # 
  # def china_cities
  #   parent_id = params[:parent_id]
  #   cities = Region.cities(parent_id)
  #   render :json => cities
  # end
  # 
  # def china_districts
  #    parent_id = params[:parent_id]
  #    districts = Region.districts(parent_id)
  #    render :json => districts
  # end
  # 
  # #######################################################
  # ## 葡萄酒世界产区
  # #######################################################
  # 
  # def region_world
  #   parent_id = params[:parent_id]
  #   regions = Wines::RegionTree.region(parent_id).order("id DESC")
  #   render :json => regions
  # end
    
end
