#encoding: utf-8
module Refinery
  module Tires
    class TiresController < ::ApplicationController

      before_filter :find_all_tires
      before_filter :find_page

      def index
        en_to_zh = {'pcr' => '轿车轮胎产品', 'suv' => 'SUV&4X4轮胎产品', 'winter' => '雪地胎产品', 'lighttruck' => '轻卡产品'}
        @category = params[:cat] # || params[:cat] = 'pcr'

        if @category
          @title = en_to_zh[@category]
          # @tires = Tire.where(:category => @category.upcase).order(:position)
        else
          @title = '产品与服务'
          # @tires = Tire.order(:position)
        end

        present(@page)
      end

      def show
        en_to_zh = {'pcr' => '轿车轮胎产品', 'suv' => 'SUV&4X4轮胎产品', 'winter' => '雪地胎产品', 'lighttruck' => '轻卡产品'}
        @tire = Tire.find(params[:id])
        @category = @tire.category.downcase
        @title = [en_to_zh[@category], @tire.decorative]
        @tires = Tire.where(:category => @category.upcase).order(:position)
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @tire in the line below:
        present(@page)
      end

      def search
        @title = "查找轮胎"
      end

      protected

      def find_all_tires
        @tires = Tire.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/tires").first
      end

    end
  end
end
