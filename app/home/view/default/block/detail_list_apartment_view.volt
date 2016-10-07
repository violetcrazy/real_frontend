{% extends 'default_home.volt' %}

{% block title %}{{ blocks['name'] }} - {{ blocks['project']['name']}}{% endblock %}
{% block description %}{{ blocks['name'] }} - {{ blocks['project']['name']}}{% endblock %}
{% block keywords %}{{ blocks['name'] }} - {{ blocks['project']['name']}}{% endblock %}

{% block top_js %}
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}jquery.maphilight.js?{{ config.asset.version }}"></script>
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}jquery.flexslider-min.js?{{ config.asset.version }}"></script>
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}block.js?{{ config.asset.version }}"></script>
{%  endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'block_detail', 'slug': blocks['slug'], 'id': blocks['id']}) }}" />
{% endblock %}

{% block content %}
    {% set getTrend = getTrend() %}
    {% set img_dir = config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/img/' %}
    <div class="block-search search-home">
        <div class="container">
            {{ searchBlock }}
        </div>
    </div>

    {% include "default/element/breadcrumbs.volt" %}

    <div class="container">
        <h2 class="title-block title-page">
            {{ blocks['name'] }}
            <div class="dropdown custom-select filter-inline menu" id="load_block">
                <input type="hidden" name="location" value="" />
                <button type="button" id="location" data-toggle="dropdown" data-id="{{ blocks['project']['id']  }}" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="arrow"></span></button>
                <ul aria-labelledby="type-project" class="dropdown-menu">
                </ul>
            </div>
        </h2>
        <div class="block-view-map">
            <div class="header">
                <a href="{{ url({ 'for' : 'block_detail', 'slug' : blocks['slug'], 'id' : blocks['id'], 'query' : '?' ~ http_build_query({'type_view': '1'}) }) }}" class="line-icon pull-left">
                    <span class="icon">
                        <img src="{{ config.asset.frontend_url }}ic-view-method/ic_Image View_20px.png">
                    </span>
                    <b>Hình ảnh phối cảnh</b>
                </a>

                <a href="{{ url({ 'for' : 'block_detail', 'slug' : blocks['slug'], 'id' : blocks['id'], 'query' : '?' ~ http_build_query({'type_view': '2'}) }) }}" class="line-icon pull-left">
                    <span class="icon">
                        <img src="{{ config.asset.frontend_url }}ic-view-method/ic_Plan View_20px.png">
                    </span>
                    <b>Sơ đồ</b>
                </a>

                <a href="{{ url({ 'for' : 'block_detail', 'slug' : blocks['slug'], 'id' : blocks['id'], 'query' : '?' ~ http_build_query({'type_view': '3'}) }) }}" class="line-icon pull-left">
                    <span class="icon">
                        <img src="{{ config.asset.frontend_url }}ic-view-method/ic_building map_20px-03.png">
                    </span>
                    <b>Quỹ căn</b>
                </a>

                <a href="{{ url({ 'for' : 'block_detail', 'slug' : blocks['slug'], 'id' : blocks['id'], 'query' : '?' ~ http_build_query({'type_view': '4'}) }) }}" class="line-icon pull-left active">
                    <span class="icon">
                        <img src="{{ config.asset.frontend_url }}ic-view-method/list-block.png">
                    </span>
                    <b>Danh sách sản phẩm</b>
                </a>
                <div class="clearfix"></div>
            </div>
        </div>

        <div class="wrap-list list-style5">
            <div class="entry">
                {% for item in list_apartment_block %}
                    <div class="item">
                        <div class="thumbnail">
                            <a href="{{ url({'for': 'apartment_detail', 'slug': item['slug'], 'id': item['id'] }) }}">
                                <img src="{{ item['default_image_url'] }}" alt="">
                            </a>
                        </div>
                        <div class="summary">
                            <a href="{{ url({'for': 'apartment_detail', 'slug': item['slug'], 'id': item['id'] }) }}">
                                <div class="title">{{ item['name'] }}</div>
                            </a>
                            <div class="address line-icon">
                                <span class="icon">
                                    <img src="{{ img_dir }}icon/ic-location-small.png" />
                                </span>
                                {{ item['address'] }}</div>
                            <div class="attr">
                                <p class="line-icon">
                                    <span class="icon">
                                        <img src="{{ img_dir }}icon/ic-floor-black.png"/>
                                    </span>
                                    Tầng: {{ item['floor'] }}
                                </p>
                                <p class="line-icon">
                                    <span class="icon">
                                        <img src="{{ img_dir }}icon/ic-size-black.png"/>
                                    </span>
                                    {{ item['total_area'] }} m<sup>2</sup>
                                </p>
                                <p class="line-icon">
                                    <span class="icon">
                                        <img src="{{ img_dir }}icon/ic-orientation-black.png"/>
                                    </span>
                                    {{ item['direction_text'] }}
                                </p>
                                <p class="line-icon">
                                    <span class="icon">
                                        <img src="{{ img_dir }}icon/ic_Park_20px.png"/>
                                    </span>
                                    {{ item['attributes']['view'][0] is defined ? item['attributes']['view'][0] : '--' }}
                                </p>
                                <p class="line-icon">
                                    <span class="icon"><img src="{{ img_dir }}icon/ic-bed-black.png"/></span>
                                    {{ item['bedroom_count']  }} Phòng ngủ
                                </p>
                                <p class="line-icon">
                                    <span class="icon"><img src="{{ img_dir }}icon/ic-orientation-black.png"/></span>
                                    {{ item['bathroom_count']  }} Phòng tắm
                                </p>
                            </div>

                            <div class="price">{{ currencyFormat(item['price']) }} <sup>VNĐ</sup></div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                {% endfor %}
                <div class="clearfix"></div>
            </div>
        </div>

        {{ paginationLayout }}
        {% include 'default/block/_other_block.volt' %}
    </div>
    <pre>
        {{ dump(list_apartment_block) }}
    </pre>

{% endblock %}
