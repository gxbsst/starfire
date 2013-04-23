namespace :app do
  desc "TODO"
  task :init_tires => :environment do
    def parse_spec(spec)
      if ((spec =~ /^(\d+)\/(\d+{2})(R\d+)/) == 0)
        puts "#{spec}"
        [$1, $2, $3]
      elsif ((spec =~ /^(\d.+)(R.+)$/) == 0)
        [$1, nil, $2]
      elsif ((spec =~ /^(LT\d+)\/(\d+{2})(R.+)/) == 0)
        [$1, $2, $3]
      else
        [nil, nil, nil]
      end
    end

    ActiveRecord::Base.connection.execute("TRUNCATE TABLE tire_items")

    files = ["pcr.csv", 'suv.csv' ]
    files.each do |file_name|
      csv = CSV.read(Rails.root.join('lib', 'tasks', 'pcr', file_name))
      csv.each do |i|
        # 175/70R13 175 => tyre, 70 => aspect_ratio, R13 => diameter
        spec = parse_spec(i[2])
        item = {
            :decorative => i[1],
            :tyre => spec[0],
            :aspect_ratio => spec[1],
            :diameter => spec[2]
        }

        begin
          puts item.inspect
          puts "i0 => #{i[0]}, i1 => #{i[1]}, i2 => #{i[2]}\n"
          @product = TireItem.create(item)
        rescue Exception => e
          puts "id ==== #{ i[0]}"
        end

      end
    end

  end

  task :update_tire_id => :environment do
    # 更新tire_id
    TireItem.all.each do |i|
      tires = Refinery::Tires::Tire.where(["decorative like ?", "%#{i.decorative.strip}%"])
      i.update_attribute('tire_id', tires.first.id) unless tires.blank?
    end
  end
    ## 更新描述和图片
  task :init_stores => :environment do
    file_name = "store.csv"
    csv = CSV.read(Rails.root.join('lib', 'tasks', file_name))
    csv.each do |item|

      Store.create({ provice: item[0],
                     city: item[1],
                     dist: item[2],
                     shop_name: item[2],
                     address: item[3],
                     full_address: ("#{item[1]}#{item[3]}") })
    end

  end


  ## 更新店地址经纬度
  task :update_store_tuge => :environment do
    Store.all.each do |r|
      tuge = Geocoder.coordinates(r.address) unless r.address.blank?
      r.update_attributes(:longitude => tuge[0], :latitude => tuge[1]) unless tuge.blank?
    end
  end

  ## 更新车型配对

  task :update_car => :environment do

    car_tires = {
        'RS-C 2.0' => 'RS-C2.0-Table 1.csv',
        'RS-R 1.0' => 'RS-R1.0-Table 1.csv',
        'RS-W 3.0' => 'RS-W3.0-Table 1.csv',
        'RS-T 4.0' => 'RS-T4.0-Table 1.csv',
        'RS-L 909' => 'RS-L909-Table 2.csv',
        'RS-V 66' => 'RS-V66-Table 1.csv',
        'SF-510' => 'SF510-Table 1.csv'
    }

    car_tires.each do |decorative, filename|
      filename =  Rails.root.join('lib', 'tasks', 'car', filename )
      csv = CSV.open(filename, :headers => true)
      temp = []
      csv.each do |item|
        tire_id = Refinery::Tires::Tire.find_by_decorative(decorative).try(:id)
        temp << item[1] if item[1].present?
        Brand.find_or_create_by_brand_name_zh_and_car_type_zh_and_tire_id(temp.last, item[2], tire_id, :brand_name_en => temp.last, :car_type_en => item[2])
      end

    end
  end


end
