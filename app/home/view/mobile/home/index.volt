{% extends 'mobile_template.volt' %}

{% block title %}{% if systemConfig['meta_title'] is defined %}{{ systemConfig['meta_title'] }}{% endif %}{% endblock %}
{% block description %}{% if systemConfig['meta_description'] is defined %}{{ systemConfig['meta_description'] }}{% endif %}{% endblock %}
{% block keywords %}{% if systemConfig['meta_keywords'] is defined %}{{ systemConfig['meta_keywords'] }}{% endif %}{% endblock %}

{% block content %}

    {% set childrenSearch = getChildrenSearch() %}
    {% set adultSearch = getAdultSearch() %}
    {% set typeSearch = getTypeSearch() %}
    {% set minRoomSearch = getMinRoomSearch() %}
    {% set maxRoomSearch = getMaxRoomSearch() %}

    <div class="slider-home">
        <div style="background-image: url({{ config.asset.frontend_url ~ 'mobile/version-1.0/template/asset/img/data-example/slider-home.jpg' }})" class="entry-slider">
            <form action="{{ url({ 'for' : 'search' }) }}" class="form-search">
                <select name="type" class="custom">
                    {% for key, item in typeSearch %}
                        <option value="{{ key }}">{{ item }}</option>
                    {% endfor %}
                </select>

                <select name="location" class="custom">
                    {% for key, item in list_by_province %}
                        {% if item|length == 1 %}
                            <option value="p-{{ item[0]['id'] }}">{{ item[0]['province_name'] ~ ' - ' ~ item[0]['name'] }}</option>
                        {% else %}
                            <opgroup label="{{ item[0]['province_name'] }}">
                                {% for sub_item in item %}
                                    <option value="p-{{ sub_item['id'] }}">{{ key ~ ' - ' ~ sub_item['name'] }}</option>
                                {% endfor %}
                            </opgroup>
                        {% endif %}
                    {% endfor %}
                </select>

                <select name="adults" class="custom">
                    {% for key, item in adultSearch %}
                        <option value="{{ key }}">{{ item }}</option>
                    {% endfor %}
                </select>

                <select name="children" class="custom">
                    {% for key, item in childrenSearch %}
                        <option value="{{ key }}">{{ item }}</option>
                    {% endfor %}
                </select>

                <select name="price_min" class="custom">
                    {% for key, item in prices['min_price'] %}
                        <option value="{{ key }}">{{ item }}</option>
                    {% endfor %}
                </select>

                <select name="price_max" class="custom">
                    {% for key, item in prices['max_price'] %}
                        <option value="{{ key }}">{{ item }}</option>
                    {% endfor %}
                </select>

                <div class="action-button">
                    <button type="submit" class="esta-button text-center block">Tìm kiếm</button>
                </div>

            </form>
        </div>
    </div>

    <div class="block-articles">
        <h2 class="title-style1 text-center">Dự án</h2>
        <div class="list-style1">
            {{ projectLayout }}
        </div>
    </div>

    {% if apartmentBlockLayout is defined and apartmentBlockLayout|length %}
        {% for itemBlock in apartmentBlockLayout %}
            {{ itemBlock }}
        {% endfor %}
    {% endif %}
{% endblock %}