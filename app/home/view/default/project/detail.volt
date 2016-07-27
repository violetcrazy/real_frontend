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
        <h2 class="title-block title-page">{{ project['name'] }}</h2>

        <div class="block-view-map">
            <div class="wrap-image">
                <div class="block-map">
                    {% if project['map_view']|length %}
                        <img src="{{ config.asset.frontend_url ~ 'upload/stories/' ~ project['map_view'][0]['image']}}" usemap="#planetmap" class="map" />

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
                            <img src="{{ config.cdn.dir_upload ~ project['default_image']}}">
                        {% else %}
                            <img src="{{ config.asset.frontend_url ~ 'img/noimage.jpg?' ~ config.asset.version }}" />
                        {% endif %}
                    {% endif %}
                </div>
            </div>
        </div>

        <div class="block-detail">
            <div class="overview">
                <div class="tab-custom">
                    <div class="tr">
                        <div class="th">Tổng quan</div>
                        <div class="td">
                            <div class="line-icon p">
                                <span class="icon">
                                    <img src="{{ config.asset.frontend_url }}icon/ic-position.png?"{{ config.asset.version }} />
                                </span>
                                <b>Dự án: {{ project['name'] }} - {{ project['province']['name'] }}</b>
                            </div>

                            <div class="row layout-4">
                                {% if getTrend[project['direction_text']] is defined %}
                                    <div class="col-xs-3">
                                        <div class="line-icon p">
                                            <span class="icon">
                                                <img src="{{ config.asset.frontend_url }}icon/ic-orientation-black.png?"{{ config.asset.version }} />
                                            </span>
                                            <b>{{ getTrend[project['direction_text']] }}</b>
                                        </div>
                                    </div>
                                {% endif %}

                                <div class="col-xs-3">
                                    <div class="line-icon p">
                                        <span class="icon">
                                            <img src="{{ config.asset.frontend_url }}icon/ic-ha.png?{{ config.asset.version }}" />
                                        </span>
                                        <b>{{ project['total_area'] }} ha</b>
                                    </div>
                                </div>

                                <div class="col-xs-3">
                                    <div class="line-icon p">
                                        <span class="icon">
                                            <img src="{{ config.asset.frontend_url }}icon/ic-tree.png?{{ config.asset.version }}" />
                                        </span>
                                        <b>{{ project['green_area'] }} m<sup>2</sup></b>
                                    </div>
                                </div>

                                <div class="col-xs-3">
                                    <div class="line-icon p">
                                        <span class="icon">
                                            <img src="{{ config.asset.frontend_url }}icon/ic_Pen House_20px.png?"{{ config.asset.version }} />
                                        </span>
                                            <b>{{ project['block_count'] }} blocks</b>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
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
                        <div class="th">Trạng thái</div>
                        <div class="td">
                            <div class="row">
                                <div class="col-xs-3">
                                    <div class="line-icon p">
                                    <span class="icon">
                                        <img src="{{ config.asset.frontend_url }}icon/ic_Apartment_20px.png?"{{ config.asset.version }} />
                                    </span>
                                        <b>Căn hộ: {{ currencyFormat(project['apartment_count']) }}</b>
                                    </div>
                                </div>

                                <div class="col-xs-3">
                                    <div class="line-icon p">
                                        <span class="icon"></span>
                                        <b>Còn trống: {{ currencyFormat(project['apartment_available_count']) }}</b>
                                    </div>
                                </div>

                                <div class="col-xs-3">
                                    <div class="line-icon p">
                                        <span class="icon"></span>
                                        <b>Đang xử lý: {{ currencyFormat(project['apartment_processing_count']) }}</b>
                                    </div>
                                </div>

                                <div class="col-xs-3">
                                    <div class="line-icon p">
                                        <span class="icon"></span>
                                        <b>Đã bán: {{ currencyFormat(project['apartment_sold_count']) }}</b>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>

                    <div class="tr">
                        <div class="th">Các kiểu căn hộ</div>
                        <div class="td clear-p">
                            <div class="row layout-3">
                                {% for item in project['attribute']['type'] %}
                                    <div class="col-xs-4">
                                        <div class="line-icon p">
                                            {{ item['name'] }}
                                        </div>
                                    </div>
                                {% endfor %}
                            </div>
                        </div>
                    </div>

                    <div class="tr">
                        <div class="th">Hướng nhìn</div>
                        <div class="td clear-p">
                            <div class="row layout-3">
                                {% for item in project['attribute']['view'] %}
                                    <div class="col-xs-4">
                                        <div class="line-icon p">
                                            {{ item['name'] }}
                                        </div>
                                    </div>
                                {% endfor %}
                            </div>
                        </div>
                    </div>

                    <div class="tr">
                        <div class="th">Tiện ích</div>
                        <div class="td clear-p">
                            <div class="row layout-3">
                                {% for item in project['attribute']['utility'] %}
                                    <div class="col-xs-4">
                                        <div class="line-icon p">
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
