<div class="main-content">
    <h2 class="title-style1">{{ blocks['name'] }}</h2>
    {% set getTrend = getTrend() %}
    {% set floor_name_list = blocks['floor_name_list']|json_decode(true) %}

    <div class="slides-apartment custom-swiper row-main m-b-20">
        <div class="swiper-container">
            <div class="swiper-wrapper">
                {% if (blocks['gallery_url'] is defined and blocks['gallery_url']|length > 0) %}
                    {% for image in  blocks['gallery_url'] %}
                        <div class="swiper-slide">
                            <div class="entry">
                                <div class="thumbnail-custom">
                                    <div style="background-image: url({{ image }})" class="img"></div>
                                </div>
                            </div>
                        </div>
                    {% endfor %}
                {% else %}
                    {% if (blocks['default_image_url'] != "") %}
                        <div class="swiper-slide">
                            <div class="entry">
                                <div class="thumbnail-custom">
                                    <div style="background-image: url({{ blocks['default_image_url'] }})" class="img"></div>
                                </div>
                            </div>
                        </div>
                    {% endif %}
                {% endif %}
            </div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>
    </div>

    <h3 class="title-style1">Tổng quan</h3>
    <div class="address-line"> {{ blocks['project_address'] }} {{ blocks['province_name'] != '' ? ' - ' ~ blocks['province_name']  : '' }}</div>

    <div class="block-property-single layout-3-col m-t-10">
        <div class="line-icon">
            <img src="{{ config.asset.frontend_url }}icon/ic-ha.png?{{ config.asset.version }}" class="icon" />
            {{ blocks['area'] }} ha
        </div>

        <div class="line-icon">
            <img src="{{ config.asset.frontend_url }}icon/ic-tree.png?{{ config.asset.version }}" class="icon" />
            {{ blocks['space'] }} m<sup>2</sup>
        </div>

        <div class="line-icon">
            <img src="{{ config.asset.frontend_url }}icon/ic-orientation-black.png?{{ config.asset.version }}" class="icon" />
            {{ blocks['trend'] }}
        </div>

        <div class="clearfix"></div>
        <div class=" m-t-10">
            <img src="{{ config.asset.frontend_url }}icon/ic_Pen House_20px.png?{{ config.asset.version }}" class="icon" />
            <b>{{ blocks['apartment_all_count'] }} Sản phẩm</b>
        </div>

        <div class="clearfix m-t-10"></div>
        <div class="line-icon">Còn trống {{ blocks['apartment_available_count'] }}</div>
        <div class="line-icon">Đang xử lý {{ blocks['apartment_processing_count'] }}</div>
        <div class="line-icon">Đã bán {{ blocks['apartment_sold_count'] }}</div>

        <div class="clearfix"></div>
    </div>
    <div class="description m-t-10">
        <div class="short">{{ niceWordsByChars(blocks['description'], 200) }}...</div>
        <div class="long">
            {{ blocks['description'] }}
        </div>
        {% if blocks['description']|length > 200 %}
            <div class="more-link"><a class="link"> [+Xem thêm]</a></div>
        {% endif %}
    </div>

    <div class="hr"></div>

    <h3 class="title-style1">Kiểu sản phẩm</h3>
    <div class="block-property-single layout-2-col">
        {% if blocks['property_type']|length > 0 %}
            {% for item in blocks['property_type'] %}
                <div class="line-icon">
                    {% if item['image_one_url'] != '' %}
                        <img src="{{ item['image_one_url'] }}" class="icon" />
                    {% endif %}
                    {{ item['name'] }}
                </div>
            {% endfor %}
        {% endif %}
        <div class="clearfix"></div>
    </div>
    <div class="hr"></div>

    <h3 class="title-style1">Hướng nhìn</h3>
    <div class="block-property-single layout-2-col">
        {% if blocks['property_view']|length > 0 %}
            {% for item in blocks['property_view'] %}
                <div class="line-icon">
                    {% if item['image_one_url'] != '' %}
                        <img src="{{ item['image_one_url'] }}" class="icon" />
                    {% endif %}
                    {{ item['name'] }}
                </div>
            {% endfor %}
        {% endif %}
        <div class="clearfix"></div>
    </div>
    <div class="hr"></div>

    <h3 class="title-style1">Tiện ích</h3>
    <div class="block-property-single layout-2-col">
        {% if blocks['property_utility']|length > 0 %}
            {% for item in blocks['property_utility'] %}
                <div class="line-icon">
                    {% if item['image_one_url'] != '' %}
                        <img src="{{ item['image_one_url'] }}" class="icon" />
                    {% endif %}
                    {{ item['name'] }}
                </div>
            {% endfor %}
        {% endif %}
        <div class="clearfix"></div>
    </div>
    <div class="hr"></div>

    <div class="clearfix m-b-20" ></div>

    {% if other_block is not empty %}
        <h3 class="title-style1">Block khác</h3>
        <div class="slides-project-other custom-swiper row-main">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    {% for item in other_block %}
                        <div class="swiper-slide">
                            <a  href="{{ url({ 'for' : 'block_detail', 'slug' : item['slug'], 'id' : item['id'] }) }}">
                                <div class="entry">
                                    <div class="thumbnail-custom">
                                        <div style="background-image: url({{ config.cdn.dir_upload ~ item['default_image']}})" class="img"></div>
                                    </div>
                                    <div class="caption">
                                        <h3 class="title">{{ item['name'] }}</h3>
                                    </div>
                                </div>
                            </a>
                        </div>
                    {% endfor %}
                </div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
    {% endif %}
</div>

{% set js_dir = config.asset.frontend_url ~ 'mobile/version-1.0/template/asset/js/' %}
<script type="text/javascript" src="{{ js_dir ~ 'swiper.js?' ~ config.asset.version }}"></script>
<script type="text/javascript" src="{{ js_dir ~ 'block.js?' ~ config.asset.version }}"></script>