{% extends 'default_apartment.volt' %}

{% block title %}{{ article['name'] }}{% endblock %}
{% block description %}{{ article['name'] }}{% endblock %}
{% block keywords %}{{ article['name'] }}{% endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'home'}) }}" />
{% endblock %}

{% block breadcrumbs %}
    <div class="breadcrumbs">
        <div class="container">
            <a href="">Trang chủ</a>
            <span class="symbol">></span>
            {% if categorySeo is defined and categorySeo|length %}
                {{ implode(', ', categorySeo) }}
                <span class="symbol">></span>
            {% endif %}
            <a class="current">{{ article['name'] }}</a>
        </div>
    </div>
{% endblock %}

{% block content %}
    <div class="row-section">
        <div class="row m-b-30">
            <div class="container">
                <div class="col-xs-8">
                    <div class="news-detail">
                          <h1 class="title">{{ article['name'] }}</h1>
                          <div class="date"><i>Đăng lúc {{ date('H:i:s , d/m/Y', strtotime(article['updated_at'])) }}</i></div>
                          <div class="wysiwyg">
                              {{ article['description'] }}
                          </div>
                    </div>
                </div>
                <div class="col-xs-4">
                    {% if categories is defined and categories|length %}
                        {% for item  in categories %}
                            <div class="entry sidebar-news-detail m-b-30">
                                <h2 class="title-block title-page">{{ item['name'] }}</h2>
                                {% if articleByCategoryLayout[item['id']] is defined and articleByCategoryLayout[item['id']] != '' %}
                                    {{ articleByCategoryLayout[item['id']] }}
                                {% endif %}
                            </div>
                            <div class="clearfix"></div>
                        {% endfor %}
                    {% endif %}
                </div>
            </div>
        </div>
    </div>
{% endblock %}
{% block bottom_js %}
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}jquery.flexslider-min.js?{{ config.asset.version }}"></script>
    <script type="text/javascript" src="{{ config.application.base_url ~ 'asset/default/home/js/article_list.js?' ~ config.asset.version }}"></script>
{%  endblock %}
