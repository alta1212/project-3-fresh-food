(function($) {
  'use strict';

  /*-------------------------------------------------------------------------------
  Cookies
  -------------------------------------------------------------------------------*/
  function setCookie(cname, cvalue, days){

    if (days) {
      var date = new Date();
      date.setTime(date.getTime() + (days * 24 * 60 * 60 *1000));
      var expires = "; expires=" + date.toGMTString();
    } else {
      var expires = "";
    }
    document.cookie = cname + "=" + cvalue + expires + "; path=/";
  }

  //Return a particular cookie
  function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
      var c = ca[i];
      while (c.charAt(0) == ' ') {
        c = c.substring(1);
      }
      if (c.indexOf(name) == 0) {
        return c.substring(name.length, c.length);
      }
    }
    return "";
  }

  //Checks if a cookie exists
  function checkCookie(cookieToCheck){
    var cookie = getCookie(cookieToCheck);
    if (cookie != "") {
      return true;
    }
    return false;
  }

  //Delet an existing cookie
  function deleteCookie( name ) {
    document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
  }

  /*-------------------------------------------------------------------------------
  Newsletter popup close and set cookie
  -------------------------------------------------------------------------------*/
  $(".newsletter-popup-trigger").on('click', function(){
    setCookie('newsletter_popup_viewed', 'true');
  });

  $('#androNewsletterPopup').on('hidden.bs.modal', function () {
    setCookie('newsletter_popup_viewed', 'true');
  });

  /*-------------------------------------------------------------------------------
  Preloader
	-------------------------------------------------------------------------------*/
  $(window).on('load', function() {
    $('.andro_preloader').addClass('hidden');

    if(!checkCookie('newsletter_popup_viewed')){
      setTimeout(function(){
        $("#androNewsletterPopup").modal('show');
      }, 3000);
    }

  });

  /*-------------------------------------------------------------------------------
  Aside Menu
	-------------------------------------------------------------------------------*/
  $(".aside-trigger-right").on('click', function() {
    var $el = $(".andro_aside-right")
    $el.toggleClass('open');
    if ($el.hasClass('open')) {
      setTimeout(function(){
        $el.find('.sidebar').fadeIn();
      }, 300);
    }else{
      $el.find('.sidebar').fadeOut();
    }
  });

  $(".aside-trigger-left").on('click', function() {
    $(".andro_aside-left").toggleClass('open');
  });

  $(".andro_aside .menu-item-has-children > a").on('click', function(e) {
    var submenu = $(this).next(".sub-menu");
    e.preventDefault();

    submenu.slideToggle(200);
  });

  /*-------------------------------------------------------------------------------
  Custom scroll bars
  -------------------------------------------------------------------------------*/
  $('.andro_dropdown-scroll').slimScroll({
    height: 300,
    position: "right",
    size: "5px",
    color: "#dcdcdc",
    opacity: 1,
    wheelStep: 5,
    touchScrollStep: 50,
  });

  /*-------------------------------------------------------------------------------
  Sticky Header
	-------------------------------------------------------------------------------*/
  var header = $(".can-sticky");
  var headerHeight = header.innerHeight();

  function doSticky() {
    if (window.pageYOffset > headerHeight) {
      header.addClass("sticky");
    } else {
      header.removeClass("sticky");
    }
  }
  doSticky();

  /*-------------------------------------------------------------------------------
  Tooltips
  -------------------------------------------------------------------------------*/
  $('[data-toggle="tooltip"]').tooltip();

  /*-------------------------------------------------------------------------------
  Magnific Popup
  -------------------------------------------------------------------------------*/
  $('.popup-youtube').magnificPopup({
    type: 'iframe'
  });
  $('.popup-vimeo').magnificPopup({
    type: 'iframe'
  });
  $('.popup-video').magnificPopup({
    type: 'iframe'
  });
  $('.gallery-thumb').magnificPopup({
    type: 'image',
    gallery: {
      enabled: true
    },
  });

  /*-------------------------------------------------------------------------------
  ion Range Sliders (Price filter)
  -------------------------------------------------------------------------------*/
  $(".js-range-slider").ionRangeSlider();

  $('.andro_product-single-thumb')
    .wrap('<span style="display:inline-block" class="andro_product-single-zoom"></span>')
    .css('display', 'block')
    .parent()
    .zoom();

  /*-------------------------------------------------------------------------------
  Countdown
  -------------------------------------------------------------------------------*/
  $(".andro_countdown-timer").each(function(){
    var $this = $(this);
    $this.countdown($this.data('countdown'), function(event) {
      $(this).text(
        event.strftime('%D days %H:%M:%S')
      );
    });
  });

  /*-------------------------------------------------------------------------------
  Checkout Notices
  -------------------------------------------------------------------------------*/
   $(".andro_notice a").on('click', function(e){
     e.preventDefault();

     $(this).closest('.andro_notice').next().slideToggle();
   });

   /*-------------------------------------------------------------------------------
   Open/Close Category Bar
   -------------------------------------------------------------------------------*/
   $(".andro_category-mm").on('click', function(){
     $(this).toggleClass('open');
   })

  /*-------------------------------------------------------------------------------
  Daily deals slider
  -------------------------------------------------------------------------------*/
  $(".deals-slider, .andro_testimonials").slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    dots: true,
    autoplay: true,
    responsive: [
      {
        breakpoint: 991,
        settings: {
          slidesToShow: 2,
        }
      },
      {
        breakpoint: 575,
        settings: {
          slidesToShow: 1,
        }
      }
    ]
  });

  /*-------------------------------------------------------------------------------
  Daily deals slider
  -------------------------------------------------------------------------------*/
  $(".andro_grid-slider").slick({
    slidesToShow: 4,
    slidesToScroll: 1,
    arrows: true,
    dots: false,
    autoplay: false,
    responsive: [
      {
        breakpoint: 991,
        settings: {
          slidesToShow: 3,
          autoplay: true,
          arrows: false,
        }
      },
      {
        breakpoint: 768,
        settings: {
          slidesToShow: 2,
          arrows: false,
        }
      },
      {
        breakpoint: 575,
        settings: {
          slidesToShow: 1,
          arrows: false,
        }
      }
    ]
  });

  /*-------------------------------------------------------------------------------
  Other mentions slider
  -------------------------------------------------------------------------------*/
  $(".andro_other-mentions-slider").slick({
    slidesToShow: 4,
    slidesToScroll: 1,
    arrows: true,
    prevArrow: $('.andro_other-mentions .slider-prev'),
    nextArrow: $('.andro_other-mentions .slider-next'),
    dots: false,
    autoplay: false,
    responsive: [
      {
        breakpoint: 991,
        settings: {
          slidesToShow: 3,
        }
      },
      {
        breakpoint: 768,
        settings: {
          slidesToShow: 2,
        }
      },
      {
        breakpoint: 450,
        settings: {
          slidesToShow: 1,
        }
      }
    ]
  });

  /*-------------------------------------------------------------------------------
  Banner slider (Home v1)
  -------------------------------------------------------------------------------*/
  $(".banner-1 .andro_banner-slider").slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    dots: true,
    autoplay: true
  });

  /*-------------------------------------------------------------------------------
  Banner slider (Home v2)
  -------------------------------------------------------------------------------*/
  $(".banner-2 .andro_banner-slider").slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    dots: false,
    autoplay: true,
  });

  /*-------------------------------------------------------------------------------
  Banner slider (Home v3)
  -------------------------------------------------------------------------------*/
  $(".banner-3 .andro_banner-slider").slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: true,
    dots: false,
    autoplay: true,
    prevArrow: $('.banner-3 .slider-prev'),
    nextArrow: $('.banner-3 .slider-next'),
  });

  /*-------------------------------------------------------------------------------
  Fresh Arrivals
  -------------------------------------------------------------------------------*/
  $(".andro_fresh-arrivals-slider").slick({
    slidesToShow: 3,
    slidesToScroll: 1,
    arrows: true,
    dots: false,
    autoplay: true,
    prevArrow: $('.andro_fresh-arrivals .slider-prev'),
    nextArrow: $('.andro_fresh-arrivals .slider-next'),
    responsive: [
      {
        breakpoint: 991,
        settings: {
          slidesToShow: 2,
        }
      },
      {
        breakpoint: 575,
        settings: {
          slidesToShow: 1,
        }
      }
    ]
  });

  /*-------------------------------------------------------------------------------
  Upsells
  -------------------------------------------------------------------------------*/
  $(".andro_upsells-slider").slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: true,
    dots: false,
    autoplay: true,
    prevArrow: $('.andro_upsells .slider-prev'),
    nextArrow: $('.andro_upsells .slider-next'),
  });

  /*-------------------------------------------------------------------------------
  Related Products / Posts
  -------------------------------------------------------------------------------*/
  $(".andro_related-posts-slider").slick({
    slidesToShow: 3,
    slidesToScroll: 1,
    arrows: true,
    dots: false,
    autoplay: true,
    prevArrow: $('.andro_related-posts .slider-prev'),
    nextArrow: $('.andro_related-posts .slider-next'),
    responsive: [
      {
        breakpoint: 991,
        settings: {
          slidesToShow: 2,
        }
      },
      {
        breakpoint: 575,
        settings: {
          slidesToShow: 1,
        }
      }
    ]
  });

  /*-------------------------------------------------------------------------------
  Masonry
  -------------------------------------------------------------------------------*/
  $('.masonry').imagesLoaded(function() {
    var isotopeContainer = $('.masonry');
    isotopeContainer.isotope({
      itemSelector: '.masonry-item',
    });
  });

  /*-------------------------------------------------------------------------------
  Add / Subtract Quantity
  -------------------------------------------------------------------------------*/
  $(".qty span").on('click', function(){
    var qty = $(this).closest('.qty').find('input');
    var qtyVal = parseInt(qty.val());
    if($(this).hasClass('qty-add')){
      qty.val(qtyVal + 1);
    }else{
      return qtyVal > 1 ? qty.val(qtyVal - 1) : 0;
    }
  })

  /*-----------------------------------
    Back to Top
    -----------------------------------*/
  $('.andro_back-to-top').on('click', function() {
    $("html, body").animate({
      scrollTop: 0
    }, 600);
    return false;
  })

  //On scroll events
  $(window).on('scroll', function() {

    doSticky();

  });

  //On resize events
  $(window).on('resize', function() {


  });

})(jQuery);



function s(elm) {
    
    var all = elm.parentElement.parentElement.parentElement;
    var anh = all.children[0].children[0].children[0].src;
    var ten = all.children[1].children[0].children[0].innerHTML;
    var giaban = all.children[2].children[0].children[1].innerHTML;
    var mota = all.children[2].children[0].children[0].innerHTML;
    var dvt = all.children[2].children[0].children[3].innerHTML;
    var id = all.id;
    $("#quickViewModal img").attr("src", anh);
    $("#quickViewModal h3").html(ten);

    $("#quickViewModal #mota").html(mota);
    $("#giagiam").html(giaban);
    $("#quickViewModal #qvbuybnt").attr("href", "/Product/Product_Details#!?masanpham="+id);
    
    
   

}

//    <div class="modal fade andro_quick-view-modal" id="quickViewModal" role="dialog" aria-hidden="true">
//        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
//            <div class="modal-content">
//                <div class="modal-body">

//                    <div class="close-btn close-dark close" data-dismiss="modal">
//                        <span></span>
//                        <span></span>
//                    </div>

//                    <div class="container-fluid">
//                        <div class="row">
//                            <div class="col-md-5">
//                                <img src="~/assets/img/products/9.png" alt="product">
//                            </div>
//                                <div class="col-md-7">

//                                    <div class="andro_product-single-content">

//                                        <div class="andro_rating-wrapper">
//                                            <div class="andro_rating">
//                                                <i class="fa fa-star active"></i>
//                                                <i class="fa fa-star active"></i>
//                                                <i class="fa fa-star active"></i>
//                                                <i class="fa fa-star active"></i>
//                                                <i class="fa fa-star"></i>
//                                            </div>
//                                            <span>4 Stars</span>
//                                        </div>

//                                        <h3> Tomatoes </h3>

//                                        <div class="andro_product-price">
//                                            <span>8$</span>
//                                            <span>14$</span>
//                                        </div>

//                                        <p class="andro_product-excerpt">Cras ultricies ligula sed magna dictum porta. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus.</p>

//                                        <form class="andro_product-atc-form">

//                                            <div class="andro_product-variation-wrapper">
//                                                <div class="form-group">
//                                                    <select class="form-control" name="amount">
//                                                        <option value="">Select Amount</option>
//                                                        <option value="1">1 Kilo</option>
//                                                        <option value="2">2 Kilos</option>
//                                                        <option value="3">3 Kilos</option>
//                                                        <option value="4">4 Kilos</option>
//                                                    </select>
//                                                </div>
//                                                <div class="form-group">
//                                                    <select class="form-control" name="breed">
//                                                        <option value="">Select a Breed</option>
//                                                        <option value="italian">Italian</option>
//                                                        <option value="egyptian">Egyptian</option>
//                                                    </select>
//                                                </div>
//                                            </div>

//                                            <div class="qty-outter">
//                                                <a href="/Product/Product_Details" class="andro_btn-custom">Buy Now</a>
//                                                <div class="qty">
//                                                    <span class="qty-subtract"><i class="fa fa-minus"></i></span>
//                                                    <input type="text" name="qty" value="1">
//                                                        <span class="qty-add"><i class="fa fa-plus"></i></span>
//                                            </div>
//                                                </div>

//                                    </form>

//                                </div>

//                                    </div>
//                                </div>
//                            </div>

//                        </div>
//                    </div>
//                </div>
//            </div>
       