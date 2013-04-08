# encoding: utf-8
class StaticsController < ApplicationController

  def index
    @title = "首页"
    @tires = Refinery::Tires::Tire.order(:position).limit(3)
    render :layout => 'home'
  end

  def contact_us
    @title = "联系我们"
  end

  def sitemap
    @title = "网站地图"
  end

  def about_us
    @title = "关于我们"
  end

  def copyright
    @title = "版权声明"
  end

  def story
    @title = '品牌故事'
  end

  def sold_worldwide
    @title = '行销全球'
  end

  def knowledge
    @title = "轮胎使用常识"
  end

end
