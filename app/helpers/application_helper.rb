# encoding: utf-8
module ApplicationHelper
  def yield_for(content_sym, default)
    output = content_for(content_sym)
    if output.blank?
      output = default
    else
      output += "- Starfiretire.com"
    end
    output
  end

  def tire_collection
    ::TireItem.tyre_all_collection
  end

  def decorative_collection
    ::TireItem.decorative_collection
  end

  def link_to_category(cat_name, params, tires)
    cat_map = {:pcr => 'PCR产品', :suv => 'SUV产品', :lighttruck => '轻卡产品', :winter => '冬季轮胎产品' }
    class_name = cat_name.to_s == params ? :current : ''
    content_tag :dl, :class => class_name do
      dt = content_tag :dt do
        link_to cat_map[cat_name], refinery.tires_tires_path(:cat => cat_name.to_s)
      end

      dd = ''
      if tires && cat_name.to_s == params
        dd =  content_tag :dd do
          content_tag :ul do
            tires.collect do |tire|
              concat %Q[<li>#{link_to "•  #{tire.title}", refinery.tires_tire_path(tire)}</li>].html_safe
              #content_tag :li do
              #  link_to "•  #{tire.title}", refinery.tires_tire_path(tire)
              #end
            end
          end
        end
      end
      dt.concat(dd)

    end
  end

  def brand_collection
    Brand.brand_collection
  end

  def link_to_statics(text, action_name, action, options = {})
    class_name = :current if action_name == action || options[:action_name] == action_name
    content_tag :dl, :class => class_name do
      content_tag :dt do
        link_to text, action
      end
    end
  end
end
