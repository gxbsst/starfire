for el in $('.menus').find('img') {
    $(el).mouseenter(function(e){
        origin_name =  $(this).attr('src');
        current_name = origin_name.match(/menu\d/) + '-o.png';
        $(this).attr('src', 'images/' + current_name);
    });

    $(el).mouseleave(function(e){
        origin_name =  $(this).attr('src');
        current_name = origin_name.match(/menu\d/) + '.png';
        $(this).attr('src', 'images/' + current_name);
    });

}
