{% extends 'default_home.volt' %}

{% block title %}{% if systemConfig['meta_title'] is defined %}{{ systemConfig['meta_title'] }}{% endif %}{% endblock %}
{% block description %}{% if systemConfig['meta_description'] is defined %}{{ systemConfig['meta_description'] }}{% endif %}{% endblock %}
{% block keywords %}{% if systemConfig['meta_keywords'] is defined %}{{ systemConfig['meta_keywords'] }}{% endif %}{% endblock %}

{% block top_js %}
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}jquery.nivo.slider.js?{{ config.asset.version }}"></script>
{% endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'home'}) }}" />
{% endblock %}

{% block content %}
    {% set img_dir = config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/img/' %}
    <div class="slider-section">
        <div class="wrap-slide slider-home text-center">
            {% if bannerHome is defined and bannerHome['image']|length > 0 %}
                {% for item in bannerHome['image'] %}
                    {% if item['src'] %}
                        {% if item['link'] != '' %}
                            <a href="{{ item['link'] }}" title="{{ item['description'] }}"">
                                <img src="{{ item['src'] }}" alt="{{ item['description'] }}">
                            </a>
                        {% else %}
                            <img src="{{ item['src'] }}" alt="{{ item['description'] }}">
                        {% endif %}
                    {% endif %}
                {% endfor %}
            {% endif %}
        </div>
        <div class="search-home block-search">
            <div class="container">
                {{ searchBlock }}
            </div>
        </div>
    </div>

    {{ projectLayout }}

    <div class="row-block-apartment">
        {% if apartmentBlockLayout is defined and apartmentBlockLayout|length %}
             {% for itemBlock in apartmentBlockLayout %}
                {{ itemBlock }}
            {% endfor %}
        {% endif %}
    </div>
{% endblock %}
