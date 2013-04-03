# encoding: utf-8
class StaticsController < ApplicationController

  def index
    @title = "首页"
    render :layout => 'home'
  end

  def contact_us
    @title = "联系我们"
  end

  def sitemap
    @title = "网站地图"
  end

  def copyright
    @title = "版权声明"
  end

  def story

  end

  def knowledge
    @title = "轮胎使用常识"
  end

end
