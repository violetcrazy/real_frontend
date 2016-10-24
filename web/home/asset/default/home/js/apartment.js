$document = $(document);
var load = {
    sending: false
};

var process = false;
$document
    .ready(function() {
        $('.slider-other').flexslider({
            animation: "slide",
            animationLoop: false,
            itemWidth: 280,
            itemMargin: 0,
            minItems: 4,
            maxItems: 4,
            controlNav: false
        });

        $('#carousel').flexslider({
            animation: "slide",
            controlNav: false,
            animationLoop: false,
            slideshow: false,
            itemWidth: 140,
            itemMargin: 0,
            minItems: 5,
            maxItems: 5,
            asNavFor: '#slider'
        });

        $('#contact-agent').on('click', function(){
            $("body,html").animate({
                scrollTop: $('.form-send-agent').offset().top
            }, 800)
        });

        $('#slider').flexslider({
            animation: "slide",
            controlNav: false,
            animationLoop: false,
            slideshow: false,
            sync: "#carousel"
        });


    })

    .on('click', '.item-share', function(event){
        event.preventDefault();
        var href = $(this).attr('href');
        newwindow=window.open(href,'Sahre','height=500,width=500');
        if (window.focus) {newwindow.focus()}
        return false;
    })

    .on('click', '.list-gallery a', function() {
        if (!process) {
            process = true;
            var id = $(this).attr('data-id'),
                apartment_id = $(this).attr('data-aid'),
                url = $(this).attr('data-url');

            $('.body-slider').height($('.body-slider').height()).addClass('loadding');

            $.ajax({
                'url': url,
                'type': 'POST',
                'data': {
                    'id': id,
                    'apartment_id': apartment_id
                },
                success: function(data) {
                    $('.body-slider').html(data);
                    $('.body-slider img').load(function(){
                        $('.body-slider #carousel').flexslider({
                            animation: "slide",
                            controlNav: false,
                            animationLoop: false,
                            slideshow: false,
                            itemWidth: 140,
                            itemMargin: 0,
                            minItems: 5,
                            maxItems: 5,
                            asNavFor: '#slider'
                        });

                        $('.body-slider #slider').flexslider({
                            animation: "slide",
                            controlNav: false,
                            animationLoop: false,
                            slideshow: false,
                            sync: "#carousel",
                            start: function() {
                                $('.body-slider').height($('.apartment-slider').height()).removeClass('loadding');
                            }
                        });
                    });

                    load.sending = false;

                }
            }).done(function () {
                process = false;

            });
        }
    });
