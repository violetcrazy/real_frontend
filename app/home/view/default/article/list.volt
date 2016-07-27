{% extends 'default_apartment.volt' %}

{% block title %}{{ category['name'] }}{% endblock %}
{% block description %}{{ category['name'] }}{% endblock %}
{% block keywords %}{{ category['name'] }}{% endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'home'}) }}" />
{% endblock %}

{% block breadcrumbs %}
    <div class="breadcrumbs">
        <div class="container">
            <a href="">Trang chủ</a>
            <span class="symbol">></span>
            <a class="current">{{ category['name'] }}</a>
        </div>
    </div>
{% endblock %}

{% block content %}
    <div class="row-section">   
        <div class="container">
            <h2 class="title-block">{{ category['name'] }}</h2>
            <div class="list-style4">
                <div class="entry">
                    {% if articles is defined and articles|length %}
                        {% for item  in articles %}
                            <div class="item">
                                <div class="thumbnail">
                                    <a href="{{ url({'for': 'article_detail', 'slug': item['slug'], 'id': item['id']}) }}" title="{{ item['name'] }}" >
                                        <div style="background-image: url({{ item['default_image_url'] }})" class="img">
                                            <img src="{{ item['default_image_url'] }}" alt="{{ item['name'] }}">
                                        </div>
                                    </a>
                                </div>
                                <div class="summary">
                                    <a href="{{ url({'for': 'article_detail', 'slug': item['slug'], 'id': item['id']}) }}" title="{{ item['name'] }}" >
                                        <h3 class="title">{{ item['name'] }}</h3>
                                    </a>
                                    <div class="entry">
                                        {{ niceWordsByChars(item['intro'], 300) }}
                                    </div>
                                </div>
                            </div>
                        {% endfor %}
                    {% endif %}
                </div>
            </div>
            
            {{ paginationLayout }}
        </div>
        
        {% if categories is defined and categories|length %}
            <div class="container">
                <div class="other-projects">
                    <h3 class="title-block">Danh mục khác</h3>
                    <div class="list-project">
                        <div class="flexslider slider-other">
                            <ul class="slides">
                                {% for item  in categories %}
                                    <li>
                                        <a href="{{ url({'for': 'article_list', 'slug': item['slug'], 'id': item['id']}) }}">
                                            <img src="{{ item['default_image_url'] }}">
                                            <h4 class="caption">{{ item['name'] }}</h4>
                                        </a>
                                    </li>
                                {% endfor %}
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        {% endif %}
    </div>  
{% endblock %}
{% block bottom_js %}
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/jquery.flexslider-min.js?' ~ config.asset.version }}"></script>
    <script type="text/javascript" src="{{ config.application.base_url ~ 'asset/default/home/js/article_list.js?' ~ config.asset.version }}"></script>
{%  endblock %}
