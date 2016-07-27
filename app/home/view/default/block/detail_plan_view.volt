{% extends 'default_home.volt' %}

{% block title %}{{ blocks['name'] }} - {{ blocks['project']['name']}}{% endblock %}
{% block description %}{{ blocks['name'] }} - {{ blocks['project']['name']}}{% endblock %}
{% block keywords %}{{ blocks['name'] }} - {{ blocks['project']['name']}}{% endblock %}

{% block top_js %}
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}jquery.maphilight.js?{{ config.asset.version }}"></script>
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}jquery.flexslider-min.js?{{ config.asset.version }}"></script>
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}block-plant.js?{{ config.asset.version }}"></script>
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
            <div class="pull-right">
                {% set floor_name_list = blocks['floor_name_list']|json_decode(true) %}
                <div class="dropdown custom-select select-scroll" id="goto-slide">
                    <input type="hidden" name="location" value="" />
                    <button type="button" id="location" data-toggle="dropdown" data-id="{{ blocks['project']['id']  }}" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                        <span class="text">
                            Chọn tầng &#160 &#160 &#160
                        </span>
                        <span class="arrow"></span></button>
                    <ul aria-labelledby="type-project" class="dropdown-menu">
                        {% if planView is not empty %}
                            {% for floorView in planView  %}
                                <li>
                                    <a href="" data-index="{{ loop.index }}">
                                        {{ floor_name_list[floorView['floor']] is defined and floor_name_list[floorView['floor']] ? floor_name_list[floorView['floor']] : 'Tầng ' ~ floorView['floor'] }}  &#160 &#160
                                    </a>
                                </li>
                            {% endfor %}
                        {% endif %}
                    </ul>
                </div>
            </div>
        </h2>
        <div class="block-view-map">
            <div class="header">
                <a href="{{ url({ 'for' : 'block_detail', 'slug' : blocks['slug'], 'id' : blocks['id'], 'query' : '?' ~ http_build_query({'type_view': '1'}) }) }}" class="line-icon pull-left">
                    <span class="icon">
                        <img src="{{ config.asset.frontend_url }}ic-view-method/ic_Image View_20px.png">
                    </span>
                    <b>Image View</b>
                </a>

                <a href="{{ url({ 'for' : 'block_detail', 'slug' : blocks['slug'], 'id' : blocks['id'], 'query' : '?' ~ http_build_query({'type_view': '2'}) }) }}" class="line-icon pull-left  active">
                    <span class="icon">
                        <img src="{{ config.asset.frontend_url }}ic-view-method/ic_plan view_red_20px-02.png">
                    </span>
                    <b>Plan view</b>
                </a>

                <a href="{{ url({ 'for' : 'block_detail', 'slug' : blocks['slug'], 'id' : blocks['id'], 'query' : '?' ~ http_build_query({'type_view': '3'}) }) }}" class="line-icon pull-left">
                    <span class="icon">
                        <img src="{{ config.asset.frontend_url }}ic-view-method/ic_building map_20px-03.png">
                    </span>
                    <b>Building map</b>
                </a>

                <div class="block-status">
                    <div class="entry">
                        <span class="item Available">Còn trống</span>
                        <span class="item Processing">Đang xử lý</span>
                        <span class="item Sold">Đã bán</span>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="wrap-image flexslider">
                <ul class="slides">
                    {% if planView is not empty %}
                        {% for floorView in planView  %}
                        <li class="block-map block-view mod-plant">
                            <img src="{{ config.asset.frontend_url ~ 'upload/block/' ~ floorView['image'] }}" usemap="#planetmap{{ floorView['floor'] }}" class="map">
                            {% if floorView['map'] is not empty %}
                                <map id="map-tag" name="planetmap{{ floorView['floor'] }}">
                                    {% for map in floorView['map'] %}
                                        <area data-id="{{ map['apartment_id'] }}"
                                              data-maphilight="{&quot;strokeColor&quot;:&quot;a81f28&quot;,&quot;strokeWidth&quot;:0,&quot;fillColor&quot;:&quot;a81f28&quot;,&quot;fillOpacity&quot;:1}"
                                              title="{{ map['apartment_name'] }}"
                                              shape="poly"
                                              coords="{{ map['coords'] }}">
                                    {% endfor %}
                                </map>
                            {% endif %}
                        </li>
                        {% endfor %}
                    {% endif %}
                </ul>
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
    $(document).ready(function(){
        $('area').on('click', function(e){
            e.preventDefault();
            var id = $(this).data('id');
            $('.block-view-map').find('.block-info-popup').remove();
            $.ajax({
                url: '{{ url({'for': 'apartment_quick_view'}) }}',
                data: {id: id},
                success: function(data){
                    $('.block-view-map').append(data);
                    $('.block-view-map').find('.block-info-popup').fadeIn('fast');
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

            })
        });

    })
    </script>
{% endblock %}
