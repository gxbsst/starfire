$(function(){

  window.Brand= Backbone.Model.extend({

  });

  window.CarType= Backbone.Model.extend({

  });

  window.Brands= Backbone.Collection.extend({
    model: Brand,
    url: '/api/regions/china_provinces', 

    initialize: function(parent_id){
      this.url += "?parent_id=" + parent_id;
    }
  });

  window.CarTypes = Backbone.Collection.extend({
    model: CarType,
    url: '/api/regions/china_cities',

    initialize: function(parent_id){
      this.url += "?parent_id=" + parent_id;
    } 

  });

  $(document).ready(function() {

    var LocationView = Backbone.View.extend({

      tagName: "option",
      initialize: function(){
        _.bindAll(this, 'render');
      },

      render: function(){
        if(this.options["type_id"] == "car_type")
        {
          (this.$el).attr('value', this.model.get('car_type_en')).html(this.model.get("car_type_zh")); 
        }
        else if(this.options["type_id"] == "brand")
        {
         (this.$el).attr('value', this.model.get('brand_name_en')).html(this.model.get("brand_name_zh"));  
        }
        return this;
      }
    });

    var LocationsView = Backbone.View.extend({

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

     var BrandView = LocationsView.extend({
      setSelectedId: function(parent_id) {
        this.carTypeView.selectedId = null;
        this.carTypeView.setProvinceId(parent_id);
      }

    });

     var CarTypeView = LocationsView.extend({
      setSelectedId: function(parent_id) {
      },
      setProvinceId: function(parent_id) {
        this.populateFrom("/api/regions/car_type?parent_id=" + encodeURI(parent_id) );
      }
    });

    var brandView = new BrandView({ el: $("#brand select"), collection: new Brands()}); 
    var carTypeView = new CarTypeView({el: $("#car_type select"), collection: new CarTypes()});

    brandView.carTypeView = carTypeView;
    
  }); // End Read

});
