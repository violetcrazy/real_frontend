{% extends 'default_home.volt' %}

{% block title %}Project list - {{ ' Page ' ~ page }} {% endblock %}
{% block description %}Project list - {{ ' Page ' ~ page }} {% endblock %}
{% block keywords %}Project list - {{ ' Page ' ~ page }} {% endblock %}

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

    {% include "default_eng/element/breadcrumbs.volt" %}

    <div class="container">
        <h2 class="title-block title-page">Project</h2>

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
                                        <h3 class="title-project">{{ project['name_eng'] }}</h3>
                                        <div class="line-icon">
                                            <span class="icon">
                                                <img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-location-small.png">
                                            </span>
                                            <b>
                                                {{ project['address_eng'] is defined and project['address_eng'] is not empty ? project['address_eng'] : '' }}
                                                {{ project['district_name'] is defined and project['district_name'] is not empty ? ', ' ~ project['district_name'] : '' }}
                                                {{ project['province_name'] is defined and project['province_name'] is not empty ? ', ' ~ project['province_name'] : '' }}
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
                                                        {{ getTrend[project['property_trend']] is defined ? getTrend[project['property_trend']] : '--' }}
                                                    </b>
                                                </div>
                                                <div class="line-icon">
                                                    <span class="icon">
                                                        <img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-ha.png">
                                                    </span>
                                                    <b>{{ project['area'] is defined and project['area'] != '' ? currencyFormat(project['area']) ~ 'm<sup>2</sup>' : '--' }} </b>
                                                </div>
                                            </div>
                                            <div class="col-xs-6">
                                                <div class="line-icon">
                                                    <span class="icon">
                                                        <img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-ha.png">
                                                    </span>
                                                    <b>{{ project['space'] is defined and project['space'] != '' ? currencyFormat(project['space']) ~ 'm<sup>2</sup>' : '--' }} </b>
                                                </div>
                                                <div class="line-icon">
                                                    <span class="icon">
                                                        <img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic_Pen House_20px.png">
                                                    </span>
                                                    <b>Apartment: {{ project['apartment_count'] is defined ? project['apartment_count'] : '--' }}</b>
                                                </div>
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="action-bottom text-center">
                                            <a href="{{ url({'for': 'project_detail', 'slug': project['slug'], 'id': project['id']}) }}" class="esta-button btn">View detail</a>
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
