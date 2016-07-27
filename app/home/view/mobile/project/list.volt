{% extends 'mobile_template.volt' %}

{% block title %}Danh sách dự án{% endblock %}
{% block description %}Danh sách dự án{% endblock %}
{% block keywords %}Danh sách dự án{% endblock %}
{% block top_js %}
    <script type="text/javascript" src="{{ js_dir ~ 'swiper.js?' ~ config.asset.version }}"></script>
    <script type="text/javascript" src="{{ js_dir ~ 'project.js?' ~ config.asset.version }}"></script>
{% endblock %}
{% block content %}
    {% set getTrend = getTrend() %}
    <div class="main-content">
        <div class="block-articles">
        <h2 class="title-style1 text-center">Dự án</h2>
        <div class="list-style1">
            {% for item in projects['result'] %}
                <div class="item">
                    <div class="entry">
                        <a href="{{ url({'for': 'project_detail', 'slug': item['slug'], 'id': item['id']}) }}" class="thumbnail" style="display: block;">
                            <div style="background-image: url({{ item['default_image_url'] }})" class="img"></div>
                            <div class="caption">
                                <h3 class="title">{{ item['name'] }}</h3>
                                <h3 class="location">{{ item['province_name'] }}</h3>
                            </div>
                        </a>
                    </div>
                </div>
            {% endfor %}
        </div>
        <div class="pagination">
            {{ paginationLayout }}
        </div>
    </div>
    </div>
{% endblock %}
