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
    class_name = cat_name.to_s == params ? "current" : ''

    content_tag :dl, :class => class_name do
      dt = content_tag :dt do
        link_to cat_map[cat_name], refinery.tires_tires_path(:cat => cat_name.to_s)
      end

      dd = ''
      if tires && cat_name.to_s == params
        dd =  content_tag :dd do
          content_tag :ul do
            tires.collect do |tire|
              class_name = request.params[:id].to_i == tire.id ? "hover" : ''
              li_class_name = if tire.decorative == 'RS-C88' || tire.decorative == 'RS-W 5.0'
               "tire_#{tire.id} new"
              else
               "tire_#{tire.id}"
              end
              concat %Q[<li class="#{li_class_name}">#{link_to "•  #{tire.decorative}", refinery.tires_tire_path(tire), :class => class_name}</li>].html_safe
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

  def nav_path(c_name, a_name)

    text_hash =  {
        'statics' => {
            'sold_worldwide' => '关于斯达飞',
            'story' => '关于斯达飞',
            'contact_us' => '关于斯达飞',
            'knowledge' =>  '产品与服务',
            'sitemap' => '首页',
            'copyright' => '首页',
            'about_us' => '首页'

        },
        'tires' => {
            'index' => '产品与服务',
            'show' => '产品与服务',
            'search' => '产品与服务'
        },
        'items' => {
            'index' =>'媒体中心',
            'media' => '媒体中心'
        },
        'stores' => {
            'show' => '营销网络',
            'search' => '营销网络',
            'search_2' => '营销网络'
        }
    }

    url_hash = {
       '关于斯达飞' => '/sold_worldwide',
       '首页' => '/',
       '产品与服务' => '/tires',
       '媒体中心' => '/news',
       '营销网络' => '/stores/1'
    }



    begin
      text = text_hash[c_name][a_name]
      path = url_hash[text]
    rescue
     text = '首页'
      path = '/'
    end
    link_to text, path
     #if c_name == 'statics'
  end

  def show_title(title)

    url_hash = {
        '关于斯达飞' => '/sold_worldwide',
        '首页' => '/',
        '产品与服务' => '/tires',
        '媒体中心' => '/news',
        '营销网络' => '/stores/1',
        'PCR产品' => '/tires?cat=pcr',
        'SUV产品' => '/tires?cat=suv',
        '轻卡产品' => '/tires?cat=lighttruck',
        '冬季轮胎产品' => '/tires?cat=winter'

    }

    if title.is_a? Array
      %Q[<span class='red_dp'>#{link_to title.first, url_hash[title.first]} > </span>] + %Q[<span class='red_dp'>#{title.last}</span>]
    else
      %Q[<span class='red_dp'>#{title} </span>]
    end
  end

  def show_first_path(c_name, a_name, title)
    if a_name == 'index' &&  !params[:cat].present?  && c_name != 'items'
      %Q[<span>#{nav_path(c_name, a_name)}  </span>]
    else
      %Q[<span>#{nav_path(c_name, a_name)} > </span>]
    end
  end

  def show_nav_path(c_name, a_name, title)
    if a_name == 'index' && !params[:cat].present? && c_name != 'items'
      show_first_path(c_name, a_name, title)
    else
      show_first_path(c_name, a_name, title) +  show_title(title)
    end
  end

end
