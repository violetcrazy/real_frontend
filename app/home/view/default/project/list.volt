{% extends 'default_home.volt' %}

{% block title %}Danh sách dự án - {{' Trang ' ~ page }} {% endblock %}
{% block description %}Danh sách dự án - {{ ' Trang ' ~ page }} {% endblock %}
{% block keywords %}Danh sách dự án - {{ ' Trang ' ~ page }} {% endblock %}

{% block top_css %}
    <link rel="stylesheet" href="{{ config.asset.frontend_url ~ 'plugins/owl/assets/owl.carousel.min.css' }}?{{ config.asset.version }}" />
{% endblock %}

{% block top_js %}
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'plugins/owl/owl.carousel.min.js' }}?{{ config.asset.version }}"></script>
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}project_list.js?{{ config.asset.version }}"></script>
{%  endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'project_list'}) }}" />
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
        <h2 class="title-block title-page">Dự án</h2>

        {% if projects is defined and projects['result']|length %}
            <div class="list-post1 list-project">
                {% for project in projects['result'] %}
                    <div class="item item-3">
                        <div class="entry">
                            <div class="image-item">
                                {#
                                <div class="flash-info">
                                    <span class="text-top">Located on One of the best</span>
                                    <span class="score">10</span>
                                    <span class="text-bottom">beaches of the world</span>
                                </div>
                                #}
                                <div class="caption col-xs-4">
                                    <div class="entry2">
                                        <h3 class="title-project">{{ project['name'] }}</h3>
                                        <div class="line-icon">
                                            <span class="icon">
                                                <img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-location-small.png">
                                            </span>
                                            <b>
                                                {#
                                                {{ project['address'] is defined and project['address'] != '' ? project['address'] : '' }}
                                                {{ project['district']['name'] is defined and project['district']['name'] != '' ? ', ' ~ project['district']['name'] : '' }}
                                                #}
                                                {{ project['province']['name'] is defined and project['province']['name'] != '' ? project['province']['name'] : '' }}
                                            </b>
                                        </div>
                                        <hr />

                                        <div class="row">
                                            <div class="col-xs-6">
                                                <div class="line-icon">
                                                    <span class="icon">
                                                        <img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-orientation-black.png">
                                                    </span>
                                                    <b>
                                                        {{ project['direction_text'] is defined ? project['direction_text'] : '' }}
                                                    </b>
                                                </div>
                                                <div class="line-icon">
                                                    <span class="icon">
                                                        <img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-ha.png">
                                                    </span>
                                                    <b>{{ project['total_area'] is defined and project['total_area'] != '' ? currencyFormat(project['total_area']) ~ 'ha' : '--' }} </b>
                                                </div>
                                            </div>
                                            <div class="col-xs-6">
                                                <div class="line-icon">
                                                    <span class="icon">
                                                        <img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-ha.png">
                                                    </span>
                                                    <b>{{ project['green_area'] is defined and project['green_area'] != '' ? currencyFormat(project['green_area']) ~ 'ha' : '--' }} </b>
                                                </div>
                                                <div class="line-icon">
                                                    <span class="icon">
                                                        <img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic_Pen House_20px.png">
                                                    </span>
                                                    <b>Căn hộ: {{ project['apartment_count'] is defined ? project['apartment_count'] : '--' }}</b>
                                                </div>
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="action-bottom text-center">
                                            <a href="{{ url({'for': 'project_detail', 'slug': project['slug'], 'id': project['id']}) }}" class="esta-button btn">Xem chi tiết</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="thumbnail-block">
                                    <div class="run-slides owl-carousel">
                                        {% if project['gallery'] is defined %}
                                            {% set galleries = project['gallery']|json_decode(true) %}
                                            {% if galleries|length %}
                                                {% for image in galleries %}
                                                    <div class="item">
                                                        <div style="background-image: url({{ config.cdn.dir_upload ~ image }})" class="fixframe thumb">
                                                            <img src="{{ config.cdn.dir_upload ~ image }}">
                                                        </div>
                                                    </div>
                                                {% endfor %}
                                            {% else %}
                                                <div class="item">
                                                    <div style="background-image: url({{ config.cdn.dir_upload ~ project['default_image'] }})" class="fixframe thumb">
                                                        <img src="{{ config.cdn.dir_upload ~ project['default_image'] }}">
                                                    </div>
                                                </div>
                                            {% endif %}
                                        {% else %}
                                            <div class="item">
                                                <div style="background-image: url({{ config.cdn.dir_upload ~ project['default_image'] }})" class="fixframe thumb">
                                                    <img src="{{ config.cdn.dir_upload ~ project['default_image'] }}">
                                                </div>
                                            </div>
                                        {% endif %}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                {% endfor %}
            </div>

            <div class="clearfix"></div>
            {{ paginationLayout }}
        {% endif %}
    </div>
{% endblock %}
