$(function(){

  window.Local = Backbone.Model.extend({

  });

  window.Province = Backbone.Model.extend({

  });

  window.City = Backbone.Model.extend({

  });

  window.District = Backbone.Model.extend({

  });


  // window.Locals = Backbone.Collection.extend({
  //   model: Local,
  //   url: ' ',
  //   initialize: function(url){
  //     this.url = url; 
  //   }
  // });


  window.Provinces = Backbone.Collection.extend({
    model: Province,
    url: '/api/regions/china_provinces', 

    initialize: function(parent_id){
      this.url += "?parent_id=" + parent_id;
    }
  });

  window.Cities = Backbone.Collection.extend({
    model: City,
    url: '/api/regions/china_cities',

    initialize: function(parent_id){
      this.url += "?parent_id=" + parent_id;
    } 

  });

  window.Districts = Backbone.Collection.extend({
    model: District,
    url: '/api/regions/china_districts',

    initialize: function(parent_id){
      this.url += "?parent_id=" + parent_id;
    }
  });

  $(document).ready(function() {

    window.LocationView = Backbone.View.extend({

      tagName: "option",

      initialize: function(){
        _.bindAll(this, 'render');
      },

      render: function(){
        
        if(this.options["type_id"] == "aspect_ratio")
        {
          (this.$el).attr('value', this.model.get('aspect_ratio')).html(this.model.get("aspect_ratio")); 
        }
        else if(this.options["type_id"] == "diameter")
        {
         (this.$el).attr('value', this.model.get('diameter')).html(this.model.get("diameter"));  
        }
        return this;
      }
    });

    window.LocationsView = Backbone.View.extend({

      events: {
        "change": "changeSelected"
      },

      initialize: function(){
        _.bindAll(this, 'addOne', 'addAll');
        this.collection.bind('reset', this.addAll);            
      },       
      addOne: function(location){
        var locationView = new LocationView({ model: location, type_id: $(this.el).parent().attr('id') });
        this.locationViews.push(locationView);        
        $(this.el).append(locationView.render().el);
      },        
      addAll: function(){
        _.each(this.locationViews, function(locationView) { locationView.remove(); });
        this.locationViews = [];
        _.each(this.locations, function(location){ location.remove(); })
        this.collection.each(this.addOne);
        if (this.selectedId) {
          $(this.el).val(this.selectedId);
        }
      },
      changeSelected: function(){
        this.setSelectedId($(this.el).val());
      },
      populateFrom: function(url) {
        this.collection.url = url;
        this.collection.fetch();
        this.setDisabled(false);
      },
      setDisabled: function(disabled) {
        $(this.el).attr('disabled', disabled);
      }
    });

    window.ProvinceView = LocationsView.extend({
      setSelectedId: function(parent_id) {
        this.cityView.selectedId = null;
        this.cityView.setProvinceId(parent_id);
        this.districtView.collection.reset();
        this.districtView.setDisabled(true);
        
        // if 30x10.5
        var patt = /x/ig;
        if(patt.test(parent_id))
        {
          this.cityView.setDisabled(true);
          this.districtView.setDisabled(false);
          this.districtView.setCityId(parent_id, 'tyre');
        }
        // $("#user_users_profile_province").val(parent_id);
      }

    });

    window.CityView = LocationsView.extend({
      setSelectedId: function(parent_id) {
        this.districtView.selectedId = null;
        this.districtView.setCityId(parent_id);
        // $("#user_users_profile_city").val(parent_id);
      },
      setProvinceId: function(parent_id) {
        this.populateFrom("/api/regions/aspect_ratio?parent_id=" + encodeURI(parent_id) );
      }

    });

    window.DistrictView = LocationsView.extend({
      setSelectedId: function(parent_id) {
        // $("#user_users_profile_district").val(parent_id);
        
        // Do nothing
      },
      setCityId: function(parent_id, parent_type) {
        // this.populateFrom("cities/" + cityId + "/suburbs");
        parent_type = parent_type || "aspect_ratio"
        this.populateFrom("/api/regions/diameter?parent_id=" + encodeURI(parent_id) + "&parent_type=" + parent_type );
      }
    });

    var provinceView = new ProvinceView({ el: $("#tyre select"), collection: new Provinces()}); 
    var cityView = new CityView({el: $("#aspect_ratio select"), collection: new Cities()});
    var districtView = new DistrictView({el: $("#diameter select"), collection: new Districts()});

    provinceView.cityView = cityView;
    provinceView.districtView = districtView;  
    cityView.districtView = districtView;  
    
    
    
  }); // End Read


});




