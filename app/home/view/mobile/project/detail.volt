{% extends 'mobile_template.volt' %}

{% block title %}{% if systemConfig['meta_title'] is defined %}{{ systemConfig['meta_title'] }}{% endif %}{% endblock %}
{% block description %}{% if systemConfig['meta_description'] is defined %}{{ systemConfig['meta_description'] }}{% endif %}{% endblock %}
{% block keywords %}{% if systemConfig['meta_keywords'] is defined %}{{ systemConfig['meta_keywords'] }}{% endif %}{% endblock %}
{% block top_js %}
    <script type="text/javascript" src="{{ js_dir ~ 'swiper.js?' ~ config.asset.version }}"></script>
    <script type="text/javascript" src="{{ js_dir ~ 'project.js?' ~ config.asset.version }}"></script>
{% endblock %}
{% block content %}
    {% set getTrend = getTrend() %}
    {% set img_dir = config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/img/' %}

    <div class="project-single">
        <h1 class="title-style1 m-t-15 text-center">{{ project['name'] }}</h1>
        <div class="thumbnail-project thumbnail-custom">
            <div style="background-image: url({{ config.cdn.dir_upload ~  project['default_image'] }})" class="img"></div>
            {% if project['blocks'] is defined and project['blocks']|length %}
                <div class="caption">
                    <a href="{{ url({ 'for' : 'block_detail', 'slug' : project['blocks'][1]['slug'], 'id' : project['blocks'][1]['id'] }) }}" class="esta-button">
                        Xem căn hộ
                    </a>
                </div>
            {% endif %}
        </div>
        {% if project['gallery_url'] is not empty %}
        <div class="slides-project custom-swiper">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    {% for image_url in project['gallery_url'] %}
                    <div class="swiper-slide">
                        <div class="entry">
                            <div class="thumbnail-custom">
                                <div style="background-image: url({{ image_url }})" class="img"></div>
                            </div>
                            {#<div class="caption">
                                <h3 class="title">Lorem ipsum dolor.</h3>
                                <div class="des">Lorem ipsum dolor. Lorem ipsum dolor.</div>
                            </div>#}
                        </div>
                    </div>
                    {% endfor %}
                </div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
        {% endif %}
        <div class="main-content">
            <h3 class="title-style1">Tổng quan</h3>
            <div class="address-line"> {{ project['address'] }}</div>
            <div class="block-property-single layout-3-col m-t-10">
                <div class="line-icon"><img src="{{ config.asset.frontend_url }}icon/ic-ha.png?{{ config.asset.version }}" class="icon" />{{ project['area'] }} ha</div>
                <div class="line-icon"><img src="{{ config.asset.frontend_url }}icon/ic-tree.png?{{ config.asset.version }}" class="icon" />{{ project['space'] }} m<sup>2</sup></div>
                <div class="line-icon"><img src="{{ config.asset.frontend_url }}icon/ic_Pen House_20px.png?{{ config.asset.version }}" class="icon" />{{ project['block_count'] }} blocks</div>
                <div class="line-icon"><img src="{{ config.asset.frontend_url }}icon/ic-orientation-black.png?{{ config.asset.version }}" class="icon" />{{ getTrend[project['property_trend']] }}</div>
                <div class="clearfix"></div>
            </div>
            <div class="description m-t-10">
                <div class="short">{{ niceWordsByChars(project['description'], 200) }}...</div>
                <div class="long">
                    {{ project['description'] }}
                </div>
                {% if project['description']|length > 200 %}
                    <div class="more-link"><a class="link"> [+Xem thêm]</a></div>
                {% endif %}
            </div>
            <div class="hr"></div>
            <h3 class="title-style1">Kiểu dự án</h3>
            <div class="block-property-single layout-2-col">
                {% for item in project['property_type'] %}
                    <div class="line-icon">
                        {% if item['image_one_url'] != '' %}
                            <img src="{{ item['image_one_url'] }}" class="icon" />
                        {% endif %}    
                        {{ item['name'] }}
                    </div>
                {% endfor %}
                <div class="clearfix"></div>
            </div>
            <div class="hr"></div>
            <h3 class="title-style1">Hướng bacol</h3>
            <div class="block-property-single layout-2-col">
                {% for item in project['property_view'] %}
                    <div class="line-icon">
                        {% if item['image_one_url'] != '' %}
                            <img src="{{ item['image_one_url'] }}" class="icon"/>
                        {% endif %}
                        {{ item['name'] }}
                    </div>
                {% endfor %}
                <div class="clearfix"></div>
            </div>
            <div class="hr"></div>
            <h3 class="title-style1">Tiện ích</h3>
            <div class="block-property-single layout-2-col">
                {% for item in project['property_utility'] %}
                    <div class="line-icon">
                        {% if item['image_one_url'] != '' %}
                            <span class="icon">
                                <img src="{{ item['image_one_url'] }}" class="icon" />
                            </span>
                        {% endif %}
                        {{ item['name'] }}
                    </div>
                {% endfor %}
                <div class="clearfix"></div>
            </div>
            <div class="hr"></div>
            {% include 'mobile/project/_other_project.volt' %}
        </div>
    </div>
{% endblock %}