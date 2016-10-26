$document = $(document);
$document.ready(function(){
    $('.slider-other').flexslider({
        animation: "slide",
        animationLoop: false,
        itemWidth: 350,
        itemMargin: 0,
        minItems: 3,
        maxItems: 3,
        controlNav: false
    });
    
    $('.new1 .navigation .title').hover(function(){
        var index = $(this).index();
        $('.new1 .entry').css({
            'top':  - index * 465 + 'px'
        });
    }, function(){});
});