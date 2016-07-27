<div class="apartment-slider">
    <div class="wrap-slider-big">
        <div class="price">${{ currencyFormat(apartment['price']) }}</div>
        <div class="caption">
            <div class="pull-left">
                {% if albums is defined and albums|length %}
                    {% for album in albums %}
                        <label data-id="{{ album['id']}}" data-aid="{{ apartment['id']}}" data-url="{{ url({'for': 'load_gallery_ajax'}) }}"  id="modern" class="line {% if album['id'] == albumId %}active{% endif %}">
                            <span class="mark"></span>
                            <span class="price-item">{{ album['name']}} - {{ album['price']}} VND</span>
                        </label>
                    {% endfor %}
                {% endif %}
            </div>
            {% if apartment['furniture_name'] is not empty %}
                <div class="pull-right">
                    <div class="info-contact">
                        <div class="image-logo"><img src="http://placehold.it/80"></div>
                        <div class="info">
                            <p class="text">Furnished by <br><b>{{ apartment['furniture_name'] }}</b></p><a>Click here to contact >></a>
                        </div>
                    </div>
                </div>
            {% endif %}
            <div class="clearfix"></div>
        </div>
        <div id="slider" class="flexslider">
            <ul class="slides">
                {% if albums is defined and albums|length %}
                    {% for album in albums %}
                        {% if album['id'] == albumId and album['gallery'] is defined and  album['gallery']| length %}
                            {% for g in album['gallery'] %}
                                <li>
                                    <span class="entry">
                                        <img src="{{ g['image_url'] }}">
                                    </span>
                                </li>
                            {% endfor %}
                        {% endif %}
                    {% endfor %}
                {% endif %}
            </ul>
        </div>
    </div>
    <div id="carousel" class="flexslider">
        <ul class="slides">
            {% if albums is defined and albums|length %}
                {% for album in albums %}
                    {% if album['id'] == albumId and album['gallery'] is defined and  album['gallery']|length %}
                        {% for g in album['gallery'] %}
                            <li>
                                <span class="entry">
                                    <img src="{{ g['image_thumbnail_url'] }}">
                                </span>
                            </li>
                        {% endfor %}
                    {% endif %}
                {% endfor %}
            {% endif %}
        </ul>
    </div>
</div>