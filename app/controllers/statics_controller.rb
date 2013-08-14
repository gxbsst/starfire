# encoding: utf-8
class StaticsController < ApplicationController

  caches_page :except => [:index]

  def index
    @title = "首页"
    @tire = Refinery::Tires::Tire.order(:position).limit(1).try(:first)
    @news = @item = Refinery::News::Item.translated.order(:publish_date).limit(1).try(:first)
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

  def company
    @title = '企业介绍'
  end

  def brand
    @title = '品牌介绍'
  end

  def knowledge
    @title = "轮胎使用常识"
  end

end
