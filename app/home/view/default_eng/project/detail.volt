{% extends 'default_home.volt' %}

{% block title %}{{ project['name_eng'] }}{% endblock %}
{% block description %}{{ project['name_eng'] }}{% endblock %}
{% block keywords %}{{ project['name_eng'] }}{% endblock %}

{% block top_js %}
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}jquery.maphilight.js?{{ config.asset.version }}"></script>
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}jquery.flexslider-min.js?{{ config.asset.version }}"></script>
    <script type="text/javascript">
        var url_ajax_quick_view = '{{ url({'for': 'block_quick_view'}) }}';
    </script>
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}project.js?{{ config.asset.version }}"></script>
{%  endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'project_detail', 'slug': project['slug_eng'], 'id': project['id']}) }}" />
{% endblock %}

{% block content %}
    {% set getTrend = getTrend() %}

    {% set img_dir = config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/img/' %}
    <div class="block-search search-home">
        <div class="container">
            {{ searchBlock }}
        </div>
    </div>

    {% include "default_eng/element/breadcrumbs.volt" %}

    <div class="container">
        <h2 class="title-block title-page">{{ project['name_eng'] }}</h2>

        <div class="block-view-map">
            <div class="wrap-image">
                <div class="block-map">
                    {% if project['map_view']|length %}
                        <img src="{{ config.asset.frontend_url ~ 'upload/project/' ~ project['map_view'][0]['image']}}" usemap="#planetmap" class="map" />

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
                        <div class="th">Overview</div>
                        <div class="td">
                            <div class="line-icon p">
                                <span class="icon">
                                    <img src="{{ config.asset.frontend_url }}icon/ic-position.png?"{{ config.asset.version }} />
                                </span>
                                <b>Project: {{ project['name_eng'] }} - {{ project['province']['name'] }}</b>
                            </div>

                            <div class="row layout-4">
                                {% if getTrend[project['property_trend']] is defined %}
                                    <div class="col-xs-3">
                                        <div class="line-icon p">
                                            <span class="icon">
                                                <img src="{{ config.asset.frontend_url }}icon/ic-orientation-black.png?"{{ config.asset.version }} />
                                            </span>
                                            <b>{{ getTrend[project['property_trend']] }}</b>
                                        </div>
                                    </div>
                                {% endif %}

                                <div class="col-xs-3">
                                    <div class="line-icon p">
                                        <span class="icon">
                                            <img src="{{ config.asset.frontend_url }}icon/ic-ha.png?"{{ config.asset.version }} />
                                        </span>
                                        <b>{{ project['area'] }} ha</b>
                                    </div>
                                </div>

                                <div class="col-xs-3">
                                    <div class="line-icon p">
                                        <span class="icon">
                                            <img src="{{ config.asset.frontend_url }}icon/ic-tree.png?"{{ config.asset.version }} />
                                        </span>
                                        <b>{{ project['space'] }} m<sup>2</sup></b>
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
                                    {{ niceWordsByChars(project['description_eng'], 200) }}
                                </div>
                                <div class="long">
                                    {{ project['description_eng'] }}
                                </div>

                                {% if project['description_eng']|length > 200 %}
                                    <div class="more-link">
                                        <a class="link">[+ View more]</a>
                                    </div>
                                {% endif %}
                            </div>
                        </div>
                    </div>

                    <div class="tr">
                        <div class="th">Status</div>
                        <div class="td">
                            <div class="row">
                                <div class="col-xs-3">
                                    <div class="line-icon p">
                                    <span class="icon">
                                        <img src="{{ config.asset.frontend_url }}icon/ic_Apartment_20px.png?"{{ config.asset.version }} />
                                    </span>
                                        <b>
                                            Apartment: {{ currencyFormat(project['apartment_count']) }}</b>
                                    </div>
                                </div>

                                <div class="col-xs-3">
                                    <div class="line-icon p">
                                        <span class="icon"></span>
                                        <b>
                                            Available: {{ currencyFormat(project['apartment_available_count']) }}</b>
                                    </div>
                                </div>

                                <div class="col-xs-3">
                                    <div class="line-icon p">
                                        <span class="icon"></span>
                                        <b>
                                            Processing: {{ currencyFormat(project['apartment_processing_count']) }}</b>
                                    </div>
                                </div>

                                <div class="col-xs-3">
                                    <div class="line-icon p">
                                        <span class="icon"></span>
                                        <b>
                                            Sold: {{ currencyFormat(project['apartment_sold_count']) }}</b>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>

                    <div class="tr">
                        <div class="th">Property Types</div>
                        <div class="td clear-p">
                            <div class="row layout-3">
                                {% for item in project['property_type_eng'] %}
                                    <div class="col-xs-4">
                                        <div class="line-icon p">
                                            {% if item['image_one_url'] != '' %}
                                                <span class="icon">
                                                    <img src="{{ item['image_one_url'] }}" />
                                                </span>
                                            {% endif %}
                                            {{ item['name'] }}
                                        </div>
                                    </div>
                                {% endfor %}
                            </div>
                        </div>
                    </div>

                    <div class="tr">
                        <div class="th">Views</div>
                        <div class="td clear-p">
                            <div class="row layout-3">
                                {% for item in project['property_view_eng'] %}
                                    <div class="col-xs-4">
                                        <div class="line-icon p">
                                            {% if item['image_one_url'] != '' %}
                                                <span class="icon">
                                                    <img src="{{ item['image_one_url'] }}" />
                                                </span>
                                            {% endif %}
                                            {{ item['name'] }}
                                        </div>
                                    </div>
                                {% endfor %}
                            </div>
                        </div>
                    </div>

                    <div class="tr">
                        <div class="th">Utilities</div>
                        <div class="td clear-p">
                            <div class="row layout-3">
                                {% for item in project['property_utility_eng'] %}
                                    <div class="col-xs-4">
                                        <div class="line-icon p">
                                            {% if item['image_one_url'] != '' %}
                                                <span class="icon">
                                                    <img src="{{ item['image_one_url'] }}" />
                                                </span>
                                            {% endif %}
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
        {% include 'default_eng/project/_other_project.volt' %}
    </div>
{% endblock %}
