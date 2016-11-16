{% set img_dir = config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/img/' %}

<div class="block-info-popup"><span class="close"></span>
<h2 class="title-block">{{ apartment_detail['name']  }}</h2>
<div class="block-quick-info">
    <div class="row">
        <div class="col-xs-6">
            <h4 class="title">Tổng quan</h4>

            <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-floor-black.png"/></span>
                Tầng {{ apartment_detail['floor'] is defined ? apartment_detail['floor'] : '' }}
                </div>

            <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-orientation-black.png"/></span>
                {{ apartment_detail['direction_text'] }}
            </div>

            {% if apartment_detail['total_area'] > 0 %}
            <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-size-black.png"/></span>
                {{ apartment_detail['total_area'] is defined ? currencyFormat(apartment_detail['total_area']) ~  'm<sup>2</sup>': '' }}
            </div>
            {% endif %}

        </div>
        <div class="col-xs-6">
            <div class="price">
                <div class="line-icon big"><b>
                    {{ apartment_detail['price'] is defined ? currencyFormat(apartment_detail['price']) : '' }} VND
                </b></div>
            </div>
            {% if apartment_detail['attributes']['view'][0] is defined %}
                <div class="line-icon">
                    <span class="icon">
                        <img src="{{ img_dir }}evn.png">
                    </span>
                    {{ apartment_detail['attributes']['view'][0]['name'] }}
                </div>
            {% endif %}
            {% if apartment_detail['attributes']['view'][1] is defined %}
                <div class="line-icon">
                    <span class="icon">
                        <img src="{{ img_dir }}evn.png">
                    </span>
                    {{ apartment_detail['attributes']['view'][1]['name'] }}
                </div>
            {% endif %}
            {% if apartment_detail['attributes']['view'][2] is defined %}
                <div class="line-icon">
                    <span class="icon">
                        <img src="{{ img_dir }}evn.png">
                    </span>
                    {{ apartment_detail['attributes']['view'][2]['name'] }}
                </div>
            {% endif %}
        </div>
    </div>
    <hr/>

    {% if (apartment_detail['images'][2] is defined and apartment_detail['images'][2]|length) %}
        <div class="wrap-slider-popup">
            <div class="flexslider slider-popup">
                <ul class="slides">
                    {% for item in apartment_detail['images'][2] %}
                        <li><a><img src="{{ config.cdn.dir_upload ~ item['image'] }}"/></a></li>
                    {% endfor %}
                </ul>
            </div>
        </div>
    {% endif %}

    <div class="des-quick">
        <div class="entry">{{ niceWordsByChars(apartment_detail['description'], 190) }}</div>
        <div class="more-link"><a href="{{ url({'for': 'apartment_detail', 'slug': apartment_detail['slug'], 'id': apartment_detail['id']}) }}" class="link"> [Xem chi tiết]</a></div>
    </div>
</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
    $('img').each(function(){
        $(this).on('error', function(){
            var wP = $(this).parent().width();
            var src = '';
            $(this).attr('data-wp', wP);
            if(wP == 0 || wP < 0) {
                src = 'http://cdn.jinn.vn/asset/frontend/img/noimage.jpg';
            } else if(wP < 51) {
                src = 'http://cdn.jinn.vn/asset/frontend/img/noimage50.jpg';
            } else if (wP < 101){
                src = 'http://cdn.jinn.vn/asset/frontend/img/noimage100.jpg';
            } else if (wP == 501){
                src = 'http://cdn.jinn.vn/asset/frontend/img/noimage500.jpg';
            } else {
                src = 'http://cdn.jinn.vn/asset/frontend/img/noimage.jpg';
            }
            $(this).attr('src', src);
        })
    });
});
</script>
