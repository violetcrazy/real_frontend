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
                <a href="{{ url({'for': 'project_detail', 'slug': project['slug'], 'id': project['id']}) }}" class="map-view {{ request.get('list') !== 'block' ? 'active' : '' }}">Sơ đồ tổng quan</a>
                <a href="{{ url({'for': 'project_detail', 'slug': project['slug'], 'id': project['id'], 'query': '?list=block'}) }}" class="block-view {{ request.get('list') === 'block' ? 'active' : '' }}">Danh sách Block</a>
            </div>
            {{ project['name'] }}
        </h1>

        {% if request.get('list') === 'block' %}
            {% include 'default/project/_project_detail_list_block.volt' %}
        {% else %}
            {% include 'default/project/_project_detail.volt' %}
        {% endif %}


        {% include 'default/project/_other_project.volt' %}
    </div>
{% endblock %}
