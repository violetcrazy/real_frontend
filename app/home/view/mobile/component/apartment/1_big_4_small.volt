<div class="block-articles m-t-15">
    <h2 class="title-style1 text-center">{{ headerTitle }}</h2>
    <div class="list-style2">
        {% if results is defined and results|length %}
            {% for item in results %}
                <div class="item">
                    <a href="{{ url({'for': 'apartment_detail', 'slug': item['slug'], 'id': item['id']}) }}" class="entry">
                        <div class="thumbnail">
                            <div style="background-image: url({{ item['default_image_url'] }})" class="img"></div>
                            <div class="caption">
                                <div class="price">{{ currencyFormat(item['price']) }} VND </div>
                                <div class="block-right">
                                    <div class="address">{{ niceWordsByChars(item['address'], 70) }}</div>
                                    <div class="des">
                                        <span class="item">{{ item['trend_value'] }}</span>
                                        <span class="item">{{ item['space'] }}m <sup>2</sup></span>
                                        <span class="item">{{ item['bedroom_count']}} Phòng ngủ</span></div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            {% endfor %}
        {% endif %}
        <div class="link-more text-center"><a href="" class="link">See more</a></div>
    </div>
</div>
