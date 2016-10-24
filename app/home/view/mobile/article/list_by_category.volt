{% extends 'mobile_template.volt' %}

{% block title %}Tin tức{% endblock %}
{% block description %}Tin tức{% endblock %}
{% block keywords %}Tin tức{% endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'article_list_news'}) }}" />
{% endblock %}

{% block content %}
    <div class="main-content">
        {% if categories is defined and categories|length %}
            {% for key, item  in categories %}
                {% if key % 2 != 0 and key > 0 %}
                    <div class="row-section odd">
                {% else %}
                    <div class="row-section">
                {% endif %}

                    <div class="container">
                        <h2 class="title-style1 text-center big">{{ item['name'] }}</h2>
                        {% if articleByCategoryLayout[item['id']] is defined and articleByCategoryLayout[item['id']] != '' %}
                            {{ articleByCategoryLayout[item['id']] }}
                        {% endif %}
                    </div>

                </div>
                {% endfor %}
        {% else %}
            <div class="container">
                <div style="min-height: 200px">
                    Đang cập nhật ...
                </div>
            </div>
        {% endif %}
    </div>

    {% set js_dir = config.asset.frontend_url ~ 'mobile/version-1.0/template/asset/js/' %}
    <script type="text/javascript" src="{{ js_dir ~ 'swiper.js?' ~ config.asset.version }}"></script>
    <script type="text/javascript" src="{{ js_dir ~ 'news.js?' ~ config.asset.version }}"></script>
{% endblock %}