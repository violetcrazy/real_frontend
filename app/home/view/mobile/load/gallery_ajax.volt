<div class="price-main">{{ currencyFormat(apartment['price']) }} VND</div>
<div class="swiper-container">
    <div class="swiper-wrapper">
        {% if albums is defined and albums|length %}
            {% for album in albums %}
                {% if album['id'] == albumId and album['gallery'] is defined and  album['gallery']| length %}
                    {% for g in album['gallery'] %}
                        <div class="swiper-slide">
                            <div class="entry">
                                <div class="thumbnail-custom">
                                    <div style="background-image: url({{ g['image_url'] }})" class="img"></div>
                                </div>
                            </div>
                        </div>
                    {% endfor %}
                {% endif %}
            {% endfor %}
        {% endif %}
    </div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
</div>

{% if (request.getQuery('type') == 1 or request.getQuery('type') == null) %}
    {% if apartment['furniture_name'] is not empty %}
        <div class="logo-designer">
            <div class="thumbnail-custom">
                <div style="background-image: url({{ apartment['furniture_logo'] is defined ? config.cdn.dir_upload ~ apartment['furniture_logo'] : 'http://placehold.it/80'}})" class="img"></div>
            </div>
            <div class="summary">Thiết kế bởi <br> <span class="title">{{ apartment['furniture_name'] }} </span></div>
            <div class="clearfix"></div>
        </div>
    {% endif %}
{% endif %}