module Refinery
  module Tires
    class TiresController < ::ApplicationController

      before_filter :find_all_tires
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @tire in the line below:
        present(@page)
      end

      def show
        @tire = Tire.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @tire in the line below:
        present(@page)
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
