<div class="other-projects">
    <h3 class="title-block">Căn hộ khác</h3>
    <div class="list-project list-post2">
        <div class="flexslider slider-other">
            <ul class="slides">
                {% if results is defined and results|length %}
                    {% for item in results %}
                        <li>
                            <div class="item item2">
                                <div class="entry">
                                    <a href="{{ url({'for': 'apartment_detail', 'slug': item['slug'], 'id': item['id']}) }}">
                                        <div class="image-item">
                                            <div style="background-image: url({{ item['default_image_url'] }})" class="fixframe thumb">
                                                <img src="{{ item['default_image_url'] }}">
                                            </div>
                                            <div class="favorite {{ (item['save_home'] == 'true') ? 'active' : '' }}" data-id="{{ item['id'] }}"></div>
                                            <div class="caption">
                                                <div class="price">{{ currencyFormat(item['price']) }} VND</div>
                                                <div class="address">{{ item['project_name'] }}, {{ item['block_name'] }}, {{ item['name'] }}</div>
                                                <div class="info-small">
                                                    <div class="line-icon">
                                                        <span class="icon">
                                                            <img src="{{ config.asset.frontend_url }}icon/ic-orientation-icon.png">
                                                        </span>{{ item['direction_text'] }}
                                                    </div>
                                                    <div class="line-icon">
                                                        <span class="icon">
                                                            <img src="{{ config.asset.frontend_url }}icon/ic-size.png">
                                                        </span>{{ item['total_area'] }}m<sup>2</sup>
                                                    </div>
                                                    <div class="line-icon">
                                                        <span class="icon">
                                                            <img src="{{ config.asset.frontend_url }}icon/ic-bed.png">
                                                        </span>{{ item['bedroom_count']}} PN
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </li>
                    {% endfor %}
                {% endif %}
            </ul>
        </div>
    </div>
</div>
