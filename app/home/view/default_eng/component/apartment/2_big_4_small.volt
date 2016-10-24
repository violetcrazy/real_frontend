<div class="row-section">
    <div class="container">
        <h2 class="title-block">{{ headerTitle }}</h2>
        <div class="list-post2">
            <div class="row-2">
                {% if results is defined and results|length %}
                    {% set i = 0 %}
                    {% for item in results %}

                        {% if i == 5 %}
                            {% break %}
                        {% endif %}

                        {% if i == 0 or i == 4 %}
                            <div class="item item2">
                                <div class="entry">
                                    <a href="{{ url({'for': 'apartment_detail', 'slug': item['slug'], 'id': item['id']}) }}">
                                        <div class="image-item">
                                            <div style="background-image: url({{ item['default_image_url'] }})" class="fixframe thumb">
                                                <img src="{{ item['default_image_url'] }}">
                                            </div>
                                            <div class="favorite {{ (item['save_home'] == 'true') ? 'active' : '' }}" data-id="{{ item['id'] }}"></div>
                                            <div class="caption">
                                                <div class="price">$ {{ currencyFormat(item['price']) }} </div>

                                                <div class="info-small">
                                                    <div class="line-icon">
                                                        <span class="icon">
                                                            <img src="{{ config.asset.frontend_url }}icon/ic-orientation-icon.png">
                                                        </span>{{ item['trend_value'] }}
                                                    </div>
                                                    <div class="line-icon">
                                                        <span class="icon">
                                                            <img src="{{ config.asset.frontend_url }}icon/ic-size.png">
                                                        </span>{{ item['space'] }}m<sup>2</sup>
                                                    </div>
                                                    <div class="line-icon">
                                                        <span class="icon">
                                                            <img src="{{ config.asset.frontend_url }}icon/ic-bed.png">
                                                        </span>{{ item['bedroom_count']}} Bed
                                                    </div>
                                                </div>
                                                <div class="address">{{ niceWordsByChars(item['address'], 70) }}</div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        {% else %}
                            <div class="item item1">
                                <div class="entry">
                                    <a href="{{ url({'for': 'apartment_detail', 'slug': item['slug'], 'id': item['id']}) }}">
                                        <div class="image-item">
                                            <div style="background-image: url({{ item['default_image_url'] }})" class="fixframe thumb">
                                                <img src="{{ item['default_image_url'] }}">
                                            </div>
                                            <div class="favorite {{ (item['save_home'] == 'true') ? 'active' : '' }}" data-id="{{ item['id'] }}"></div>
                                            <div class="caption">
                                                <div class="price">$ {{ currencyFormat(item['price']) }}  </div>

                                                <div class="info-small">
                                                    <div class="line-icon">
                                                        <span class="icon">
                                                            <img src="{{ config.asset.frontend_url }}icon/ic-orientation-icon.png">
                                                        </span>{{ item['trend_value'] }}
                                                    </div>
                                                    <div class="line-icon">
                                                        <span class="icon">
                                                            <img src="{{ config.asset.frontend_url }}icon/ic-size.png">
                                                        </span>{{ item['space'] }}m<sup>2</sup>
                                                    </div>
                                                    <div class="line-icon">
                                                        <span class="icon">
                                                            <img src="{{ config.asset.frontend_url }}icon/ic-bed.png">
                                                        </span>{{ item['bedroom_count']}} Bed
                                                    </div>
                                                </div>
                                                <div class="address">{{ niceWordsByChars(item['address'], 30) }}</div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        {% endif %}
                        {% set i = i + 1 %}
                    {% endfor %}
                {% endif %}

                {% if results|length == 6 %}
                    <div class="item item1">
                        <div class="entry">
                            <a href="{{ url({'for': 'search', 'query': '?' ~ searchQuery}) }}" class="image-item">
                                <div style="background-image: url( {{ results[5]['default_image_url'] }} )" class="fixframe thumb">
                                    <img src="{{ results[5]['default_image_url'] }}">
                                </div>
                                <div class="counter">
                                    <div class="text">
                                        {% if totalItems > 0 %}
                                            +{{ totalItems }}
                                        {% else %}
                                            {{ totalItems }}
                                        {% endif %}
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                {% endif %}

                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
