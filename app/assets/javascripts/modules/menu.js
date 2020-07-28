$(function(){
  $('.menu-bar').click(function(){
    var $menu = $('.Wrapper').find('.Menu')
    if($menu.hasClass("open")){
      $menu.removeClass("open");
      $menu.slideUp();
    }
    else{
      $menu.addClass("open");
      $menu.slideDown();
    }
  })

  $(document).click(function(e) {
    if (!$(e.target).closest('#menubar').length) {
      var $menu = $('.Wrapper').find('.Menu')
      $menu.removeClass("open");
      $menu.slideUp();
    }
  });

});