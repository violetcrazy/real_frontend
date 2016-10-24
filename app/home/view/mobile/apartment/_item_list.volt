<div class="item">
    <a href="{{ url({'for': 'apartment_detail', 'slug': item['slug'], 'id': item['id']}) }}" class="entry-item">
        <div class="thumbnail">
            <div style="background-image: url({{ item['default_image_url'] }})" class="img"></div>
            <div class="price">
                {% if item['price'] > 0 %}
                    {{ currencyFormat(item['price']) }} VND
                {% else %}
                    Liên hệ
                {% endif %}
            </div>
        </div>
        <div class="cation">
            <h3 class="name">{{ item['name'] }}</h3>
            <div class="address">{{ item['address'] }}</div>
            <div class="hr"></div>
            <div class="block-property">
                <div class="line-icon">
                    <img src="{{ img_dir }}data-example/icon/ic-size-black.png" alt="" class="icon">
                    {{ item['area'] }}m<sup>2</sup>
                </div>

                <div class="line-icon">
                    <img src="{{ img_dir }}data-example/icon/ic-floor-black.png" alt="" class="icon">
                    Lầu {{ item['floor_count'] }}
                </div>

                {% if item['property_view']['0'] is defined and item['property_view']['0']['name'] != '' %}
                    <div class="line-icon">
                        <img src="{{ item['property_view']['0']['image_one_url'] }}" class="icon" />
                        {{ item['property_view']['0']['name'] }}
                    </div>
                {% elseif item['property_utility']['0'] is defined and item['property_utility']['0']['name'] != ''  %}
                    <div class="line-icon">
                    <img src="{{ item['property_utility']['0']['image_one_url'] }}" class="icon" />
                    {{ item['property_utility']['0']['name'] }}
                    </div>
                {% elseif attrItem is defined and attrItem['name'] != ''  %}
                    <div class="line-icon">
                        <img src="{{ attrItem['image_one_url'] }}" class="icon" />
                        {{ attrItem['name'] }}
                    </div>

                {% endif %}

                <div class="line-icon">
                    <img src="{{ img_dir }}data-example/icon/ic-bed-black.png" alt="" class="icon">
                    {{ item['bedroom_count'] }} Phòng ngủ
                </div>

                <div class="line-icon">
                    <img src="{{ img_dir }}data-example/icon/ic-orientation-black.png" alt="" class="icon">
                    {{ item['trend_value'] }}
                </div>

                <div class="line-icon">
                    <img src="{{ img_dir }}data-example/icon/ic-bath-black.png" alt="" class="icon">
                    {{ item['bathroom_count'] }} Phòng tắm
                </div>

                <div class="clearfix"></div>
            </div>
        </div>
    </a>
</div>