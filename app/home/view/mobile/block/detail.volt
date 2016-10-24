{% extends 'mobile_template.volt' %}

{% block title %}{{ blocks['name'] }} - {{ blocks['project_name']}}{% endblock %}
{% block description %}{{ blocks['name'] }} - {{ blocks['project_name']}}{% endblock %}
{% block keywords %}{{ blocks['name'] }} - {{ blocks['project_name']}}{% endblock %}

{% block content %}

<div class="block-header-tab layout-3">
    <a href="{{ url({'for': 'block_detail', 'id': blocks['id'],'slug': blocks['slug'] }) }}?type=1" class="{{ request.getQuery('type') is empty or request.getQuery('type') == 1 ? 'active' : '' }} item">Chi tiết</a>
    <a href="{{ url({'for': 'block_detail', 'id': blocks['id'],'slug': blocks['slug'] }) }}?type=2" class="{{ request.getQuery('type') is not empty and request.getQuery('type') == 2 ? 'active'  : '' }} item">Sản phẩm</a>
    <a href="{{ url({'for': 'block_detail', 'id': blocks['id'],'slug': blocks['slug'] }) }}?type=3" class="{{ request.getQuery('type') is not empty and request.getQuery('type') == 3 ? 'active'  : '' }} item">Sơ đồ</a>
    <div class="clearfix"></div>
</div>
{% if ( request.getQuery('type') is not empty and request.getQuery('type') == 2) %}
    {% include 'mobile/block/_list_apartment.volt' %}
{% elseif ( request.getQuery('type') is not empty and request.getQuery('type') == 3) %}
    {% include 'mobile/block/_floor_map.volt' %}
{% else %}
    {% include 'mobile/block/_detail_block.volt' %}
{% endif %}

{% endblock %}
