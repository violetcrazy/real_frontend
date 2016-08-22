{% extends 'default_home.volt' %}

{% block title %}{{ project['name'] }}{% endblock %}
{% block description %}{{ project['name'] }}{% endblock %}
{% block keywords %}{{ project['name'] }}{% endblock %}

{% block top_js %}
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}jquery.maphilight.js?{{ config.asset.version }}"></script>
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}jquery.flexslider-min.js?{{ config.asset.version }}"></script>
    <script type="text/javascript">
        var url_ajax_quick_view = '{{ url({'for': 'block_quick_view'}) }}';
    </script>
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}project.js?{{ config.asset.version }}"></script>
{%  endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'project_detail', 'slug': project['slug'], 'id': project['id']}) }}" />
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
        <h1 class="title-block title-page">
            <div class="pull-right tool-view">
                <a href="" class="map-view">Sơ đồ tổng quan</a>
                <a href="" class="block-view">Danh sách Block</a>
            </div>
            {{ project['name'] }}
        </h1>

        <div class="block-view-map">
            <div class="wrap-image">
                <div class="block-map">
                    {% if project['map_view']|length %}
                        <img src="{{ config.cdn.url_upload ~  project['map_view'][0]['image']}}" usemap="#planetmap" class="map" />

                        <map id="map-tag" name="planetmap">
                            {% for key, item in project['map_view'][0]['view_map'] %}
                                <area data-href="{{ url({'for': 'block_detail', 'slug': project['blocks'][key]['slug'], 'id': key}) }}"
                                    data-maphilight='{&quot;strokeWidth&quot;:0,&quot;fillColor&quot;:&quot;a71f28&quot;,&quot;fillOpacity&quot;:0.75}'
                                    shape="{{ item['shape'] }}"
                                    title="{{ project['blocks'][key]['name'] }}"
                                    data-id="{{ project['blocks'][key]['id'] }}"
                                    coords="{{ item['coords'] }}" />
                            {% endfor %}
                        </map>
                    {% else %}
                        {% if project['default_image'] != '' %}
                            <img src="{{ config.cdn.url_upload ~ project['default_image']}}">
                        {% else %}
                            <img src="{{ config.asset.frontend_url ~ 'img/noimage.jpg?' ~ config.asset.version }}" />
                        {% endif %}
                    {% endif %}
                </div>
            </div>
        </div>

        {% if (project['galleries'][constant('\ITECH\Data\Lib\Constant::MAP_IMAGE_TYPE_GALLERY')]) %}

                <div class="block-small-gallery flexslider gallery-slide">
                    <ul class="list list-unstyled slides">
                        {% for itemImage in project['galleries'][constant('\ITECH\Data\Lib\Constant::MAP_IMAGE_TYPE_GALLERY')] %}
                            <li class="item">
                                <div class="entry">
                                    <img src="{{ config.cdn.url_upload ~ itemImage['image'] }}" alt="">
                                </div>
                            </li>
                        {% endfor %}
                    </ul>
                </div>
        {% endif %}

        <div class="block-detail">
            <div class="overview">
                <div class="tab-custom">
                    <div class="tr">
                        <div class="th">
                            <span class="icon-new icon-over"></span> Tổng quan</div>
                        <div class="td">
                            <div class="p m-b-20">
                                <span class="fw-500">Dự án:</span> {{ project['name'] }} - {{ project['province']['name'] }}
                            </div>
                            <div class=" p m-b-20">
                                <span class="fw-500">Số Block/Khu:</span> {{ project['block_count'] }}
                            </div>

                            <div class="row m-b-5">
                                <div class="col-xs-3">
                                    <div class=" p">
                                        <span class="fw-500">Căn hộ</span> {{ currencyFormat(project['apartment_count']) }}
                                    </div>
                                </div>

                                <div class="col-xs-3">
                                    <div class=" p">
                                        <span class="icon"></span>
                                        <span class="fw-500">Còn trống</span> {{ currencyFormat(project['apartment_available_count']) }}
                                    </div>
                                </div>

                                <div class="col-xs-3">
                                    <div class=" p">
                                        <span class="icon"></span>
                                        <span class="fw-500">Đang xử lý:</span> {{ currencyFormat(project['apartment_processing_count']) }}
                                    </div>
                                </div>

                                <div class="col-xs-3">
                                    <div class=" p">
                                        <span class="icon"></span>
                                        <span class="fw-500">Đã bán:</span> {{ currencyFormat(project['apartment_sold_count']) }}
                                    </div>
                                </div>
                            </div>

                            <div class="description">
                                <div class="short">
                                    {{ niceWordsByChars(project['description'], 200) }}
                                </div>
                                <div class="long">
                                    {{ project['description'] }}
                                </div>

                                {% if project['description']|length > 200 %}
                                    <div class="more-link">
                                        <a class="link">[+ Xem thêm]</a>
                                    </div>
                                {% endif %}
                            </div>
                        </div>
                    </div>

                    <div class="tr">
                        <div class="th">
                            <span class="icon-new icon-type"></span>
                            Các kiểu căn hộ</div>
                        <div class="td clear-p">
                            <div class="row layout-3">
                                {% for item in project['attribute']['type'] %}
                                    <div class="col-xs-4">
                                        <div class="line-icon no-icon p">
                                            {{ item['name'] }}
                                        </div>
                                    </div>
                                {% endfor %}
                            </div>
                        </div>
                    </div>

                    <div class="tr">
                        <div class="th">
                            <span class="icon-new icon-env"></span>
                            Môi trường sống</div>
                        <div class="td clear-p">
                            <div class="row layout-3">
                                {% for item in project['attribute']['view'] %}
                                    <div class="col-xs-4">
                                        <div class="line-icon no-icon p">
                                            {{ item['name'] }}
                                        </div>
                                    </div>
                                {% endfor %}
                            </div>
                        </div>
                    </div>

                    <div class="tr">
                        <div class="th">
                            <span class="icon-new icon-util"></span>
                            Dịch vụ -  Tiện ích</div>
                        <div class="td clear-p">
                            <div class="row layout-3">
                                {% for item in project['attribute']['utility'] %}
                                    <div class="col-xs-4">
                                        <div class="line-icon no-icon p">
                                            {{ item['name'] }}
                                        </div>
                                    </div>
                                {% endfor %}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {% include 'default/project/_other_project.volt' %}
    </div>
{% endblock %}
