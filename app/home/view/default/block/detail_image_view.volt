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
                <a href="{{ url({ 'for' : 'block_detail', 'slug' : blocks['slug'], 'id' : blocks['id'], 'query' : '?' ~ http_build_query({'type_view': '1'}) }) }}" class="line-icon pull-left  active">
                    <span class="icon">
                        <img src="{{ config.asset.frontend_url }}ic-view-method/ic__image view_red_20px-01.png">
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

                <a href="{{ url({ 'for' : 'block_detail', 'slug' : blocks['slug'], 'id' : blocks['id'], 'query' : '?' ~ http_build_query({'type_view': '4'}) }) }}" class="line-icon pull-left">
                    <span class="icon">
                        <img src="{{ config.asset.frontend_url }}ic-view-method/list-block-deactive.png">
                    </span>
                    <b>Danh sách sản phẩm</b>
                </a>
                <div class="clearfix"></div>
            </div>
            <div class="wrap-image">
                <div class="block-map block-view">
                    {% if image_default is not empty %}
                        <img src="{{ config.cdn.dir_upload ~ image_default }}" width="947" usemap="#planetmap" class="map">
                    {% endif %}
                </div>
            </div>
            <div class="footer-bar">
                <div class="text-center entry">
                    <span class="item Available">Còn trống</span>
                    <span class="item Processing">Đang xử lý</span>
                    <span class="item Sold">Đã bán</span>
                </div>
            </div>
        </div>

        {% include 'default/block/_detail_block.volt' %}
        {% include 'default/block/_other_block.volt' %}
    </div>

    <script type="text/javascript">
        $(document).ready(function() {
            $('area').on('click', function(e) {
                e.preventDefault();
                var id = $(this).data('id');

                $('.block-map').find('.block-info-popup').remove();
                $.ajax({
                    url: '{{ url({'for': 'apartment_quick_view'}) }}',
                    data: {id: id},
                    success: function(data) {
                        $('.block-map').append(data);
                        $('.block-map').find('.block-info-popup').fadeIn('fast');
                        $('.slider-popup').flexslider({
                            animation: "slide",
                            animationLoop: false,
                            itemWidth: 111.333,
                            itemMargin: 0,
                            minItems: 3,
                            maxItems: 3,
                            controlNav: false
                        });
                    }
                });
            });
        });
    </script>
{% endblock %}
